initialized=$(ls .bash/bin/ | wc -l | sed 's/^ *\| *$//')
[ "${initialized}" = "0" ] && bash ~/.bash/_setup.bash

source ~/.bash/aliases.bash
source ~/.bash/functions.bash
source ~/.bash/global.bash
source ~/.bash/app_settings.bash
source ~/.bash/key_bindings.bash

[ -e ~/.bash/_private.bash ] && source ~/.bash/_private.bash

if [ $(uname) = "Darwin" ]; then
    source ~/.bash/mac.bash
elif [ $(uname) = "Linux" ]; then
    source ~/.bash/linux.bash
fi

if [ "$TERM_PROGRAM" = "alacritty" ] || [ "$TERM_PROGRAM" = "iTerm.app" ] || ([ "$WSL_DISTRO_NAME" = "Ubuntu" ] && [ "$TERM_PROGRAM" = "" ]); then
    # run tmux on startup
    if type tmux >/dev/null 2>&1; then
        if [ -z $TMUX -a $(echo $- | grep -v 'l') ]; then
            ID="$(tmux ls 2> /dev/null)"
            if [ -z "$ID" ]; then
                tmux -u new-session
            else
                new_session="Start New Session"
                IDs="$ID"
                IDs+="\n$new_session:"
                choosed_session=$(echo -e "$IDs" | fzf | cut -d: -f1)
                if [ "$choosed_session" = "${new_session}" ]; then
                    tmux -u new-session
                elif [ -n "$choosed_session" ]; then
                    tmux -u attach-session -t "$choosed_session"
                else
                    : # Start terminal normally
                fi
            fi
        fi
    fi

    if [ $(uname) = "Linux" ]; then
        # set key repeat
        xset r rate 200 40
    fi
fi

[ -f ~/.fzf.bash ] && source ~/.fzf.bash
