PROMPT="%F{magenta}%d %(?,%F{white},%F{red})%#%f "

# ls 色付け
# alias ls='ls -F --color=auto'

# vim
if [ -x "`which nvim`" ];  then
    alias vi='nvim'
    alias vim='nvim'
elif [ -x "`which vim`" ];  then
    alias vi='vim'
    alias view='vim -R'

    # manをvimで見る
    export MANPAGER="col -b -x|vim -R -c 'set ft=man nolist nomod noma' -"
fi

# copy to clipboard
if [ -x "`which xsel`" ]; then
    alias pbcopy='xsel --clipboard --input'
    alias pbpaste='xsel --clipboard --output'
fi

