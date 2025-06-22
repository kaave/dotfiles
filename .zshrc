source ~/.zsh/plugins.zsh
source ~/.zsh/global.zsh
source ~/.zsh/path.zsh
source ~/.zsh/compinit.zsh
source ~/.zsh/completion.zsh
source ~/.zsh/settings.zsh
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

# pnpm - moved to path.zsh
#
autorun_tmux
