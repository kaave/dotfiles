# get .gitignore template.
#
# example:
#   gi osx,windows,linux,node
gi() {
    curl -L -s https://www.gitignore.io/api/$@ ;
}

ip-info() {
    curl -L -s https://checkip.amazonaws.com/
}

if [ -x "`which ffmpeg`" ]; then
    giffy() {
        ffmpeg \
            -i $1 \
            -r 10 \
            $(echo $1 | sed -E 's/\.mov$/.gif/')
    }

    githubfy() {
        ffmpeg \
            -i $1 \
            -vf scale=640:-1 \
            -r 10 \
            $(echo $1 | sed -E 's/\.mov$/.gif/')
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
        git log --graph --color=always \
            --format="%C(auto)%h%d %s %C(black)%C(bold)%cr" "$@" |
        fzf --ansi --no-sort --reverse --tiebreak=index --bind=ctrl-s:toggle-sort \
            --bind "ctrl-m:execute:
                    (grep -o '[a-f0-9]\{7\}' | head -1 |
                    xargs -I % sh -c 'git show --color=always % | less -R') << 'FZF-EOF'
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

charalias() {
    alias | grep '^.=[a-zA-Z]' | sed "s/['|\']//g" | sed "s/^alias //g" | sed "s/=/: /"| sort
}
