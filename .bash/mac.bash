# Mac

# locale
export LANG=ja_JP.UTF-8
# export LANG=en_US.UTF-8

# interface
export CLICOLOR=1
export LSCOLORS=gxfxcxdxbxegedabagacad

if [ -f ~/.bash/bin/git-completion.bash ]; then
    GIT_PS1_SHOWDIRTYSTATE=1
    GIT_PS1_SHOWUPSTREAM=1
    GIT_PS1_SHOWUNTRACKEDFILES=1
    # GIT_PS1_SHOWSTASHSTATE=1
    export PS1='\[\e[32m\]\w\[\e[m\] $(__git_ps1 "(\[\e[33m\]%s\[\e[m\])" )\n\u@\h \$ '
else
    export PS1='\[\e[32m\]\w\[\e[m\] \u@\h \$ '
fi

if type gsed >/dev/null 2>&1; then alias sed=gsed; fi
if type icdiff >/dev/null 2>&1; then alias diff=icdiff; fi

add_paths=(
    "/usr/local/opt/gnu-tar/libexec/gnubin"
    "~/dev/flutter/bin"
    "~/Library/Android/sdk/emulator"
    "/usr/local/share/git-core/contrib/diff-highlight"
)
for add_path in "${add_paths[@]}" ; do
    [ -e $add_path ] && export PATH=$PATH:$add_path
done

[[ -r "/usr/local/etc/profile.d/bash_completion.sh" ]] && . "/usr/local/etc/profile.d/bash_completion.sh"

if type nvim >/dev/null 2>&1; then
    alias vi=nvim
    alias vim=nvim
    alias vimdiff='nvim -d '

    export GIT_EDITOR="env LANG=ja_JP.UTF-8 nvim -f"
    export EDITOR=nvim
elif [ -e /Applications/MacVim.app/ ]; then
    export MACVIM_PATH=/Applications/MacVim.app/Contents/MacOS
    export EDITOR=$MACVIM_PATH/Vim
    alias vim="env LANG=ja_JP.UTF-8 $MACVIM_PATH/Vim "'"$@"'
    alias vi=vim
    alias vimdiff=$MACVIM_PATH/vimdiff
    alias view=$MACVIM_PATH/view
fi

[ -e /Applications/Emacs.app ] && alias emacs="/Applications/Emacs.app/Contents/MacOS/Emacs -nw --"
[ -e /Applications/SourceTree.app ] && alias sourcetree="open -a SourceTree"
[ -e '/Applications/Marked 2.app' ] && alias mark='open -a "Marked 2"'

# eval "$(/opt/homebrew/bin/brew shellenv)"
export PATH="/opt/homebrew/bin:$PATH"
