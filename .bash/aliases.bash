alias la='ls -a'
alias ll='ls -l'
alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'
alias mkdir='mkdir -p'

# sudo の後のコマンドでエイリアスを有効にする
alias sudo='sudo '

# wrap improve tools
if type htop >/dev/null 2>&1; then alias top=htop; fi
if type hub >/dev/null 2>&1;  then alias git=hub; fi
if type lsd >/dev/null 2>&1;  then alias ls=lsd; fi
if type bat >/dev/null 2>&1;  then alias cat=bat; fi

if type code >/dev/null 2>&1; then alias cr='code . -r'; fi

# char aliases
# alias a
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
