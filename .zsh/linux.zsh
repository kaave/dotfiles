PROMPT="%F{magenta}%d %(?,%F{white},%F{red})%#%f "

# ls 色付け
# alias ls='ls -F --color=auto'

# vim
if [ -x "`which nvim`" ];  then
    alias vi='nvim'
    alias vim='nvim'
    alias vimdiff='nvim -d '

    export GIT_EDITOR="env LANG=ja_JP.UTF-8 nvim -f"
    export EDITOR=nvim
fi

if [ -x "`which xsel`" ]; then
    alias pbcopy='xsel --clipboard --input'
    alias pbpaste='xsel --clipboard --output'
fi

# fzf
if type fzf >/dev/null 2>&1; then
    if [ -e /usr/share/doc/fzf/examples ]; then
        source /usr/share/doc/fzf/examples/key-bindings.bash
        source /usr/share/doc/fzf/examples/completion.bash
    elif [ -e /usr/share/fzf ]; then
        source /usr/share/fzf/key-bindings.bash
        source /usr/share/fzf/completion.bash
    fi
fi
