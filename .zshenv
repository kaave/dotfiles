case ${OSTYPE} in
    linux*)
        # for Arch Linux
        setopt no_global_rcs
        ;;
esac

########################################
# 各言語 バージョン管理システム設定
########################################
# rbenv
# if [ -e ~/.rbenv/ ]; then
#     export PATH="$HOME/.rbenv/bin:$PATH"
#     # rbenv-binstubs用設定
#     export PATH=./vendor/bin:$PATH
#     alias be='bundle exec'
# fi

# anyenv
[ -e ~/.anyenv/ ] && eval PATH="$HOME/.anyenv/bin:$PATH"

# vim:set ft=zsh:#
