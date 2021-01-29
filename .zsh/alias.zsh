alias la='ls -a'
alias ll='ls -l'
alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'
alias mkdir='mkdir -p'

# sudo の後のコマンドでエイリアスを有効にする
alias sudo='sudo '

# htopをtop
[ -x "`which htop`" ] && alias top=htop

# gitをhub
[ -x "`which hub`" ] && alias git=hub

# ls to exa
if [ -x "`which exa`" ]; then
    alias ls=exa
else
    # ls 色付け
    export CLICOLOR=1
    export LSCOLORS=gxfxcxdxbxegedabagacad
    alias ls='ls -G -F'
fi

# グローバルエイリアス
alias -g L='| less'
alias -g G='| grep'
alias -g M='| more'

# C で標準出力をクリップボードにコピーする
# echo 'foobar' C # という感じ
# mollifier delta blog : http://mollifier.hatenablog.com/entry/20100317/p1
if which pbcopy >/dev/null 2>&1 ; then
    # Mac
    alias -g C='| pbcopy'
elif which xsel >/dev/null 2>&1 ; then
    # Linux
    alias -g C='| xsel --input --clipboard'
elif which putclip >/dev/null 2>&1 ; then
    # Cygwin
    alias -g C='| putclip'
fi

# Pythonの簡易サーバ
alias pysv='python -m SimpleHTTPServer'

# get .gitignore template
function gi() {
    curl -L -s https://www.gitignore.io/api/$@ ;
}

alias ssht='ssh -o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null'

# char aliases
# alias a=
# alias b=
# alias c=
# alias d=
alias e=emacs
# alias f=
alias g=git
# alias h=
# alias i=
# alias j=
# alias k=
# alias l=
# alias m=
alias n=node
alias o=open
# alias p=
# alias q=
# alias r=
alias s=stack
# alias t=top
# alias u=
# alias v=
# alias w=
# alias x=
alias y=yarn
# alias z=
