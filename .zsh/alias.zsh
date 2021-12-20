alias la='ls -a'
alias ll='ls -l'
alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'
alias mkdir='mkdir -p'

# sudo の後のコマンドでエイリアスを有効にする
alias sudo='sudo '

[ -x "`which htop`" ] && alias top=htop
[ -x "`which hub`" ] && alias git=hub
[ -x "`which exa`" ] && alias ls=exa
[ -x "`which bat`" ] && alias cat=bat
[ -x "`which code`" ] && alias cr='code . -r'


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

# get .gitignore template
function gi() {
    curl -L -s https://www.gitignore.io/api/$@ ;
}


# char aliases
# alias a=
alias b=bundle
alias c=cat
alias d=dotnet
alias e=emacs
# alias f
alias g=git
# alias h
# alias i
# alias j
# alias k
# alias l
alias m=make
alias n=node
alias o=open
# alias p
# alias q
# alias r
alias s=stack
# alias t
# alias u
# alias v
# alias w
# alias x
alias y=yarn
# alias z
