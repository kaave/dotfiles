alias la='ls -a'
alias ll='ls -l'
alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'
alias mkdir='mkdir -p'

# enable aliases for `sudo`
alias sudo='sudo '

# set wrapper commands
[ -x "`which htop`" ] && alias top=htop
[ -x "`which hub`" ] && alias git=hub
[ -x "`which lsd`" ] && alias ls=lsd
[ -x "`which bat`" ] && alias cat=bat

#
# global aliases.
#
alias -g L='| less'
alias -g G='| grep'
alias -g M='| more'

# copy stdout to clipboard.
#
# example:
#   echo 'foobar' C
#
# see: http://mollifier.hatenablog.com/entry/20100317/p1
if which pbcopy >/dev/null 2>&1 ; then
    # macOS
    alias -g C='| pbcopy'
elif which xsel >/dev/null 2>&1 ; then
    # Linux
    alias -g C='| xsel --input --clipboard'
elif which putclip >/dev/null 2>&1 ; then
    # Cygwin
    alias -g C='| putclip'
fi

# char aliases
# alias a=
alias b=bazel
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
alias n=npm
alias o=open
alias p=pnpm
# alias q
# alias r
alias s=stack
alias t=terraform
# alias u
# alias v
# alias w
# alias x
alias y=yarn
# alias z
