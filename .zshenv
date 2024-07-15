source ~/.zsh/functions_primitive.zsh

case ${OSTYPE} in
    linux*)
        # for Arch Linux
        setopt no_global_rcs
        ;;
esac
