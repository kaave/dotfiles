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
fi

# vagrant
if [ -x "`which vagrant`" ]; then
    alias vg='vagrant'
    # Vagrantでupしてssh
    alias vgus='vagrant up;vagrant ssh'
fi

# composer
[ -e ~/.composer ] && export PATH=$PATH:~/.composer/vendor/bin

# python
if [ -x "`which python`" ]; then
  alias venv='python -m venv'
  alias pysv='python -m http.server'
fi

[ -e ~/.rye/env ] && source "$HOME/.rye/env"

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

# Ruby
# remove bundle exec
RUBYGEMS_GEMDEPS=-
# bundler
if [ -x "`which bundle`" ]; then
    alias bl='bundle'
    alias be='bundle exec'
    alias bi='bundle install'
    alias binit='bundle install --path=vendor/bundle -j4'
    balias() { alias | grep 'bundle' | sed "s/^\([^=]*\)=\(.*\)/\1 => \2/"| sed "s/['|\']//g" | sort; }
fi

# Go
if [ -e $HOME/go ]; then
    export PATH=$PATH:$HOME/go/bin
fi

# haskell
[ -f "$HOME/.ghcup/env" ] && . $HOME/.ghcup/env # ghcup-env
# if [ -x "`which stack`" ]; then
#     alias ghc='stack ghc --'
#     alias ghci='stack ghci --'
#     alias runghc='stack runghc --'
#     alias runhaskell='stack runhaskell --'
# fi

# rustup
[ -e ~/.cargo/bin ] && export PATH="$HOME/.cargo/bin:$PATH"
[ -e ~/.local/bin ] && export PATH="$HOME/.local/bin:$PATH"

# anyenv
if [ -e ~/.anyenv/ ]; then
    export PATH="$HOME/.anyenv/bin:$PATH"
    eval "$(anyenv init - bash)"
fi

# asdf
[ -e ~/.asdf/ ] && . $HOME/.asdf/asdf.sh

# mise
if [ -x "`which mise`" ]; then
    eval "$(mise activate zsh --shims)"
    eval "$(mise activate zsh)"
fi

# direnv
[ -x "`which stack`" ] && eval "$(direnv hook zsh)"

# fzf
if [ -x "`which fzf`" ]; then
    source <(fzf --zsh)
fi

# VS Code
[ -x "`which code`" ] && alias cr='code . -r'

# z
# if [ -e ~/.bash/bin/z.sh ]; then
#     source ~/.bash/bin/z.sh

#     if type fzf >/dev/null 2>&1; then
#         __z() {
#             if [[ -z "$*" ]]; then
#                 cd "$(z -lx 2>&1 | awk '{print $2}' | fzf +s --tac)"
#                 echo
#             else
#                 _last_z_args="$@"
#                 z "$@"
#             fi
#         }

#         zz() {
#             cd "$(z -lx 2>&1 | awk '{print $2}' | fzf -q "$_last_z_args")"
#         }
#     fi
# fi

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

