source ~/.zsh/zplug.zsh
source ~/.zsh/global.zsh
source ~/.zsh/compinit.zsh
source ~/.zsh/settings.zsh
source ~/.zsh/keybinds.zsh
source ~/.zsh/alias.zsh
source ~/.zsh/app_settings.zsh

[ -e ~/.zsh/_private.zsh ] && source ~/.zsh/_private.zsh

case ${OSTYPE} in
    darwin*)
        source ~/.zsh/mac.zsh
        ;;
    linux*)
        source ~/.zsh/linux.zsh
        ;;
esac

