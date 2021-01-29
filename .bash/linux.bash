# Linux

# interface
if [ -f ~/.bash/bin/git-completion.bash ]; then
    GIT_PS1_SHOWDIRTYSTATE=1
    GIT_PS1_SHOWUPSTREAM=1
    GIT_PS1_SHOWUNTRACKEDFILES=1
    # GIT_PS1_SHOWSTASHSTATE=1
    export PS1='\[\e[35m\]\w\[\e[m\] $(__git_ps1 "(\[\e[33m\]%s\[\e[m\])" )\n\u@\h \$ '
else
    export PS1='\[\e[35m\]\w\[\e[m\] \u@\h \$ '
fi

# Source global definitions
if [ -f /etc/bashrc ]; then
    . /etc/bashrc
fi

if type nvim >/dev/null 2>&1; then
    alias vi=nvim
    alias vim=nvim
    alias vimdiff='nvim -d '

    export GIT_EDITOR="env LANG=ja_JP.UTF-8 nvim -f"
    export EDITOR=nvim
elif type vim >/dev/null 2>&1; then
    alias vi='vim'
    alias view='vim -R'
fi

if type java >/dev/null 2>&1; then
    # readlink $(which java)
    export JAVA_HOME="/usr/lib/jvm/default-runtime"
fi

# copy to clipboard
if type xsel >/dev/null 2>&1; then
    alias pbcopy='xsel --clipboard --input'
    alias pbpaste='xsel --clipboard --output'
fi

if type fzf >/dev/null 2>&1; then
    source /usr/share/fzf/key-bindings.bash
    source /usr/share/fzf/completion.bash
fi
