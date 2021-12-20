# docker
if [ -x "`which docker`" ]; then
    alias dk='docker'
    alias dkc='docker-compose'
    alias dl="docker ps -l -q"
    alias dps="docker ps"
    alias dpa="docker ps -a"
    alias di="docker images"
    alias dip="docker inspect --format '{{ .NetworkSettings.IPAddress }}'"
    alias dkd="docker run -d -P"
    alias dki="docker run -i -t -P"
    alias dex="docker exec -i -t"

    dstop() { docker stop $(docker ps -a -q); }
    drm() { docker rm $(docker ps -a -q); }
    alias drmf='docker stop $(docker ps -a -q) && docker rm $(docker ps -a -q)'
    dri() { docker rmi $(docker images -q); }
    dbu() { docker build -t=$1 .; }
    dalias() { alias | grep 'docker' | sed "s/^\([^=]*\)=\(.*\)/\1 => \2/"| sed "s/['|\']//g" | sort; }
    dbash() { docker exec -it $(docker ps -aqf "name=$1") bash; }

    [ -x "`which docker-sync-stack`" ] && alias dss='docker-sync-stack'
fi

# vagrant
if [ -x "`which vagrant`" ]; then
    alias vg='vagrant'
    # Vagrantでupしてssh
    alias vgus='vagrant up;vagrant ssh'
fi

# direnv
[ -x "`which direnv`" ] && eval "$(direnv hook zsh)"

# composer
[ -e ~/.composer ] && export PATH=$PATH:~/.composer/vendor/bin

# python
[ -x "`which python3`" ] && alias venv='python3 -m venv'
if [ -x "`which pipenv`" ]; then
    PIPENV_VENV_IN_PROJECT=1
    alias pe='pipenv'
    alias peg='pipenv graph'
    alias pei='pipenv install'
    alias pel='pipenv lock'
    alias peo='pipenv open'
    alias per='pipenv run'
    alias pes='pipenv shell'
    alias peu='pipenv update'
    alias peui='pipenv uninstall'
    palias() { alias | grep 'pipenv' | sed "s/^\([^=]*\)=\(.*\)/\1 => \2/"| sed "s/['|\']//g" | sort; }
    eval "$(pipenv --completion)"
fi

##-begin-npm-completion-################
#
# npm command completion script
#
# Installation: npm completion >> ~/.bashrc  (or ~/.zshrc)
# Or, maybe: npm completion > /usr/local/etc/bash_completion.d/npm
########################################

COMP_WORDBREAKS=${COMP_WORDBREAKS/=/}
COMP_WORDBREAKS=${COMP_WORDBREAKS/@/}
export COMP_WORDBREAKS

if type complete &>/dev/null; then
  _npm_completion () {
    local si="$IFS"
    IFS=$'\n' COMPREPLY=($(COMP_CWORD="$COMP_CWORD" \
                           COMP_LINE="$COMP_LINE" \
                           COMP_POINT="$COMP_POINT" \
                           npm completion -- "${COMP_WORDS[@]}" \
                           2>/dev/null)) || return $?
    IFS="$si"
  }
  complete -o default -F _npm_completion npm
elif type compdef &>/dev/null; then
  _npm_completion() {
    local si=$IFS
    compadd -- $(COMP_CWORD=$((CURRENT-1)) \
                 COMP_LINE=$BUFFER \
                 COMP_POINT=0 \
                 npm completion -- "${words[@]}" \
                 2>/dev/null)
    IFS=$si
  }
  compdef _npm_completion npm
elif type compctl &>/dev/null; then
  _npm_completion () {
    local cword line point words si
    read -Ac words
    read -cn cword
    let cword-=1
    read -l line
    read -ln point
    si="$IFS"
    IFS=$'\n' reply=($(COMP_CWORD="$cword" \
                       COMP_LINE="$line" \
                       COMP_POINT="$point" \
                       npm completion -- "${words[@]}" \
                       2>/dev/null)) || return $?
    IFS="$si"
  }
  compctl -K _npm_completion npm
fi
###-end-npm-completion-#################

# Go
if [ -x "`which go`" ]; then
    export GOROOT=`go env GOROOT`
    export GOPATH_ROOT=$HOME/go
    export GOPATH_THIRD_PARTY=$GOPATH_ROOT/third-party
    export GOPATH_MY_PROJECT=$GOPATH_ROOT/my-project
    export GOPATH=$GOPATH_THIRD_PARTY:$GOPATH_MY_PROJECT
    export PATH=$PATH:$GOROOT/bin:$GOPATH_THIRD_PARTY/bin:$GOPATH_MY_PROJECT/bin
fi

# Ruby
# remove bundle exec
RUBYGEMS_GEMDEPS=-
# bundler
if [ -x "`which bundle`" ]; then
    alias bl='bundle'
    alias be='bundle exec'
    alias bi='bundle install'
    balias() { alias | grep 'bundle' | sed "s/^\([^=]*\)=\(.*\)/\1 => \2/"| sed "s/['|\']//g" | sort; }
fi

# rustup
[ -e ~/.cargo/bin ] && export PATH="$HOME/.cargo/bin:$PATH"

# haskell
[ -e ~/.local/bin ] && export PATH="$HOME/.local/bin:$PATH"
if [ -x "`which stack`" ]; then
    alias ghc='stack ghc --'
    alias ghci='stack ghci --'
    alias runghc='stack runghc --'
    alias runhaskell='stack runhaskell --'
fi

