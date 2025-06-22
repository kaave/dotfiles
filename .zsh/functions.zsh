#!/usr/bin/env zsh
# Functions
# This file contains custom shell functions

# Load from .zshrc

if [ -x "`which ffmpeg`" ]; then
    giffy() {
        ffmpeg \
            -i $1 \
            -r 10 \
            $(echo $1 | sed -E 's/\.[a-zA-Z0-9]*$/.gif/')
    }

    mp4fy() {
        ffmpeg \
            -i $1 \
            -vcodec libx264 \
            -pix_fmt yuv420p \
            -vf "scale=trunc(iw/2)*2:trunc(ih/2)*2" \
            -an \
            -crf 26 \
            $(echo $1 | sed -E 's/\.[a-zA-Z0-9]*$/.mp4/')
    }
fi

if [ -x "`which fzf`" ]; then
    fbr() {
        local branches branch
        branches=$(git branch -vv) &&
        branch=$(echo "$branches" | fzf +m) &&
            git checkout $(echo "$branch" | awk '{print $1}' | sed "s/.* //")
    }

    fgh() {
        local branches branch
        branches=$(git --no-pager reflog | awk '$3 == "checkout:" && /moving from/ {print $8}' | grep -vE 'master' | uniq) &&
        branch=$(echo "$branches" | fzf +m) &&
            git checkout $(echo "$branch" | awk '{print $1}' | sed "s/.* //")
    }

    fbrr() {
        local branches branch
        branches=$(git branch --all | grep -v HEAD) &&
        branch=$(echo "$branches" | fzf-tmux -d $(( 2 + $(wc -l <<< "$branches") )) +m) &&
            git checkout $(echo "$branch" | sed "s/.* //" | sed "s#remotes/[^/]*/##")
    }

    fshow() {
        git log \
            --graph \
            --color=always \
            --format="%C(auto)%h%d %s %C(black)%C(bold)%cr" "$@" |
        fzf \
            --ansi \
            --no-sort \
            --reverse \
            --tiebreak=index \
            --bind=ctrl-s:toggle-sort \
            --bind "ctrl-m:execute:
                    (grep -o '[a-f0-9]\{7\}' | head -1 |
                    xargs -I % sh -c 'git show --color=always % | bat -p --paging=always') << 'FZF-EOF'
                    {}
                    FZF-EOF"
    }

    pr-checkout() {
        local prs pr
        prs=$(gh pr list)
        pr=$(echo "$prs" | fzf +s | sed -E 's/([0-9]+).*/\1/')
        gh pr checkout $pr
    }
fi

autorun_tmux() {
    # Check if we should run tmux
    local should_run_tmux=false
    case "$TERM_PROGRAM" in
        alacritty|iTerm.app) should_run_tmux=true ;;
    esac
    
    # WSL specific check
    [[ "$WSL_DISTRO_NAME" = "Ubuntu" && -z "$TERM_PROGRAM" ]] && should_run_tmux=true
    
    [[ "$should_run_tmux" != true ]] && return

    # Run tmux on startup
    if command -v tmux >/dev/null 2>&1 && [[ -z $TMUX && $- == *l* ]]; then
        if ! tmux list-sessions >/dev/null 2>&1; then
            tmux -u new-session
            return
        fi

        local sessions="$(tmux list-sessions)"
        local new_session="Start New Session"
        local all_sessions="$sessions\n$new_session:"
        local chosen_session=$(echo -e "$all_sessions" | fzf | cut -d: -f1)

        if [[ "$chosen_session" = "${new_session}" ]]; then
            tmux -u new-session
        elif [[ -n "$chosen_session" ]]; then
            tmux -u attach-session -t "$chosen_session"
        fi
    fi
}

# Docker helper functions (moved from app_settings.zsh)
if command -v docker >/dev/null 2>&1; then
    dstop() { docker stop $(docker ps -a -q); }
    drm() { docker rm $(docker ps -a -q); }
    dri() { docker rmi $(docker images -q); }
    dbu() { docker build -t=$1 .; }
    dalias() { alias | grep 'docker' | sed "s/^\([^=]*\)=\(.*\)/\1 => \2/"| sed "s/['|\']//g" | sort; }
    dbash() { docker exec -it $(docker ps -aqf "name=$1") bash; }
fi

# Pipenv helper function (moved from app_settings.zsh)
if command -v pipenv >/dev/null 2>&1; then
    palias() { alias | grep 'pipenv' | sed "s/^\([^=]*\)=\(.*\)/\1 => \2/"| sed "s/['|\']//g" | sort; }
fi

# Bundler helper function (moved from app_settings.zsh)
if command -v bundle >/dev/null 2>&1; then
    balias() { alias | grep 'bundle' | sed "s/^\([^=]*\)=\(.*\)/\1 => \2/"| sed "s/['|\']//g" | sort; }
fi
