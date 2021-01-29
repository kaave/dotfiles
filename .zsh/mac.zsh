PROMPT="%F{green}%~ %(?,%F{white},%F{red})%#%f "

# Homebrew-cask Setting
# if [ -x "`which brew`" ]; then
#     export HOMEBREW_CASK_OPTS="--appdir=/Applications --caskroom=/usr/local/Caskroom"
#     [ -x "`which brew`" ] && alias brew="env PATH=${PATH/\/Users\/abe\/\.pyenv\/shims:/} brew"
# fi

# Vim
if [ -x "`which nvim`" ]; then
    alias vi=nvim
    alias vim=nvim
elif [ -e /Applications/MacVim.app/ ]; then
    export MACVIM_PATH=/Applications/MacVim.app/Contents/MacOS
    alias vim="env LANG=ja_JP.UTF-8 $MACVIM_PATH/Vim "'"$@"'
    alias vi=vim
    alias vimdiff=$MACVIM_PATH/vimdiff
    alias view=$MACVIM_PATH/view

    # use vim when use man command
    export MANPAGER="col -b -x|env LANG=ja_JP.UTF-8 $MACVIM_PATH/Vim -R -c 'set ft=man nolist nomod noma' -"
    # use MacVim on Git editor
    export GIT_EDITOR="env LANG=ja_JP.UTF-8 $MACVIM_PATH/Vim -f"
fi

# Emacs
if [ -e /Applications/Emacs.app/ ]; then
    alias emacs="/Applications/Emacs.app/Contents/MacOS/Emacs -nw --"
fi

# change some default apps
[ -x "`which gsed`" ] && alias sed=gsed
[ -x "`which icdiff`" ] && alias diff=icdiff

# add Marked command if Marked installed
[ -e "/Applications/Marked 2.app/" ] && alias mark='open -a "Marked 2"'

# add diff-hightlight
export DIFF_HIGHLIGHT=/usr/local/share/git-core/contrib/diff-highlight
[ -e $DIFF_HIGHLIGHT ] && export PATH=$PATH:$DIFF_HIGHLIGHT

# powerline
# powerline-daemon -q
# . /usr/local/lib/python2.7/site-packages/powerline/bindings/zsh/powerline.zsh

