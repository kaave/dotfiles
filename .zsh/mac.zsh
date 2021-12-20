PROMPT="%F{green}%~ %(?,%F{white},%F{red})%#%f "

# Vim
if [ -x "`which nvim`" ]; then
    alias vi=nvim
    alias vim=nvim
    alias vimdiff='nvim -d '

    export GIT_EDITOR="env LANG=ja_JP.UTF-8 nvim -f"
    export EDITOR=nvim
fi

[ -e /Applications/Emacs.app ] && alias emacs="/Applications/Emacs.app/Contents/MacOS/Emacs -nw --"
[ -e /Applications/SourceTree.app ] && alias sourcetree="open -a SourceTree"
[ -e '/Applications/Marked 2.app' ] && alias mark='open -a "Marked 2"'

# change some default apps
[ -x "`which gsed`" ] && alias sed=gsed
[ -x "`which icdiff`" ] && alias diff=icdiff

# add diff-hightlight
# export DIFF_HIGHLIGHT=/usr/local/share/git-core/contrib/diff-highlight
# [ -e $DIFF_HIGHLIGHT ] && export PATH=$PATH:$DIFF_HIGHLIGHT

# powerline
# powerline-daemon -q
# . /usr/local/lib/python2.7/site-packages/powerline/bindings/zsh/powerline.zsh

# eval "$(/opt/homebrew/bin/brew shellenv)"
export PATH="/opt/homebrew/bin:$PATH"
