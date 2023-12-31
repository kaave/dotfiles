if [ "$TERM_PROGRAM" = "alacritty" ] || [ "$TERM_PROGRAM" = "iTerm.app" ] || ([ "$WSL_DISTRO_NAME" = "Ubuntu" ] && [ "$TERM_PROGRAM" = "" ]); then
    # run tmux on startup
    if [ -x "`which tmux`" ]; then
        if [[ ! -n $TMUX && $- == *l* ]]; then
            ID="`tmux list-sessions`"
            if [ -z "$ID" ]; then
                tmux -u new-session
                return
            else
                new_session="Start New Session"
                IDs="$ID"
                IDs+="\n$new_session:"
                choosed_session=$(echo -e "$IDs" | fzf | cut -d: -f1)
                if [ "$choosed_session" = "${new_session}" ]; then
                    tmux -u new-session
                    return
                elif [ -n "$choosed_session" ]; then
                    tmux -u attach-session -t "$choosed_session"
                    return
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

source ~/.zsh/zplug.zsh
source ~/.zsh/global.zsh
source ~/.zsh/compinit.zsh
source ~/.zsh/settings.zsh
source ~/.zsh/keybinds.zsh
source ~/.zsh/aliases.zsh
source ~/.zsh/functions.zsh
source ~/.zsh/app_settings.zsh

[ -e ~/.zsh/_private.zsh ] && source ~/.zsh/_private.zsh

case ${OSTYPE} in
    darwin*)
        source ~/.zsh/os/mac.zsh
        ;;
    linux*)
        source ~/.zsh/os/linux.zsh
        ;;
esac

