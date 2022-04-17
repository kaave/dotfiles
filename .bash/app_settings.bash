# docker
if type docker >/dev/null 2>&1; then
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
if type vagrant >/dev/null 2>&1; then
    alias vg='vagrant'
    # Vagrantでupしてssh
    alias vgus='vagrant up;vagrant ssh'
fi

# composer
[ -e ~/.composer ] && export PATH=$PATH:~/.composer/vendor/bin

# Python
if type python >/dev/null 2>&1; then
    alias venv='python -m venv'
    alias pysv='python -m SimpleHTTPServer'
fi

if type pipenv >/dev/null 2>&1; then
    export PIPENV_VENV_IN_PROJECT=1
    alias pe='pipenv'
    alias peg='pipenv graph'
    alias pei='pipenv install'
    alias pel='pipenv lock'
    alias peo='pipenv open'
    alias per='pipenv run'
    alias pes='pipenv shell'
    alias peu='pipenv update'
    alias peui='pipenv uninstall'
    palias() {
        alias | grep 'pipenv' | sed "s/['|\']//g" | sed "s/^alias //g" | sed "s/pipenv //"| sort
    }
    # eval (pipenv --completion)
fi

# Go
# legacy configs
# if type go >/dev/null 2>&1; then
#     export GOROOT=`go env $GOROOT`
#     export GOPATH_ROOT=$HOME/Projects/go
#     export GOPATH_THIRD_PARTY=$GOPATH_ROOT/third-party
#     export GOPATH_MY_PROJECT=$GOPATH_ROOT/my-project
#     export GOPATH=$GOPATH_THIRD_PARTY:$GOPATH_MY_PROJECT

#     [ ! -e $GOPATH_ROOT ] && mkdir -p $GOPATH_ROOT
#     [ ! -e $GOPATH_ROOT/src ] && mkdir -p $GOPATH_ROOT/src
#     [ ! -e $GOPATH_ROOT/pkg ] && mkdir -p $GOPATH_ROOT/pkg
#     [ ! -e $GOPATH_ROOT/bin ] && mkdir -p $GOPATH_ROOT/bin
#     [ ! -e $GOPATH_THIRD_PARTY/bin ] && mkdir -p $GOPATH_THIRD_PARTY/bin
#     [ ! -e $GOPATH_MY_PROJECT/bin ] && mkdir -p $GOPATH_MY_PROJECT/bin

#     export PATH=$PATH:$GOROOT/bin:$GOPATH_THIRD_PARTY/bin:$GOPATH_MY_PROJECT/bin
# fi

# Ruby
# remove bundle exec
RUBYGEMS_GEMDEPS=-

if type bundle >/dev/null 2>&1; then
    alias bl='bundle'
    alias be='bundle exec'
    alias bi='bundle install'
    alias binit='bundle install --path=vendor/bundle -j4'
    balias() { alias | grep 'bundle' | sed "s/^\([^=]*\)=\(.*\)/\1 => \2/"| sed "s/['|\']//g" | sort; }
fi

# haskell
if type stack >/dev/null 2>&1; then
    alias ghc='stack ghc --'
    alias ghci='stack ghci --'
    alias runghc='stack runghc --'
    alias runhaskell='stack runhaskell --'
fi

# anyenv
if [ -e ~/.anyenv/ ]; then
    export PATH="$HOME/.anyenv/bin:$PATH"
    eval "$(anyenv init - bash)"
fi

# asdf
if [ -e ~/.asdf/ ]; then
    . $HOME/.asdf/asdf.sh
    . $HOME/.asdf/completions/asdf.bash
fi

# direnv
if type direnv >/dev/null 2>&1; then eval "$(direnv hook bash)"; fi

# rustup
[ -e ~/.cargo/bin ] && export PATH=$PATH:~/.cargo/bin
[ -e ~/.local/bin ] && export PATH=$PATH:~/.local/bin

# ocaml
[ -e ~/.opam ] && test -r /home/kaave/.opam/opam-init/init.sh && . /home/kaave/.opam/opam-init/init.sh > /dev/null 2> /dev/null || true

# Android
export ANDROID_HOME="$HOME/Library/Android/sdk"
if [ -e $ANDROID_HOME ]; then
    export PATH=$PATH:$ANDROID_HOME/tools
    export PATH=$PATH:$ANDROID_HOME/tools/bin
    export PATH=$PATH:$ANDROID_HOME/platform-tools
    export PATH=$PATH:$ANDROID_HOME/emulator
fi

# deno
[ -e ~/.deno/bin ] && export PATH=$PATH:~/.deno/bin

# dotnet
if [ -e ~/.dotnet/tools ]; then
    export PATH="$HOME/.dotnet/tools:$PATH"
fi



# fzf
if type fzf >/dev/null 2>&1; then
    if [ -f ~/.fzf.bash ]; then
        source ~/.fzf.bash
    fi

    fbr() {
        local branches branch
        branches=$(git branch -vv) &&
        branch=$(echo "$branches" | fzf +m) &&
            git checkout $(echo "$branch" | awk '{print $1}' | sed "s/.* //")
    }

    fgh() {
        local branches branch
        branches=$(git --no-pager reflog | awk '$3 == "checkout:" && /moving from/ {print $8}' | grep -vE 'master' | uniq) &&
        branch=$(echo "$branches" | fzf +m) &&
            git checkout $(echo "$branch" | awk '{print $1}' | sed "s/.* //")
    }

    fbrr() {
        local branches branch
        branches=$(git branch --all | grep -v HEAD) &&
        branch=$(echo "$branches" | fzf-tmux -d $(( 2 + $(wc -l <<< "$branches") )) +m) &&
            git checkout $(echo "$branch" | sed "s/.* //" | sed "s#remotes/[^/]*/##")
    }

    fshow() {
        git log --graph --color=always \
            --format="%C(auto)%h%d %s %C(black)%C(bold)%cr" "$@" |
        fzf --ansi --no-sort --reverse --tiebreak=index --bind=ctrl-s:toggle-sort \
            --bind "ctrl-m:execute:
                    (grep -o '[a-f0-9]\{7\}' | head -1 |
                    xargs -I % sh -c 'git show --color=always % | less -R') << 'FZF-EOF'
                    {}
                    FZF-EOF"
    }

    pr-checkout() {
        local prs pr
        prs=$(gh pr list)
        pr=$(echo "$prs" | fzf +s | sed -E 's/([0-9]+).*/\1/')
        gh pr checkout $pr
    }
fi

# vscode alias
if type code >/dev/null 2>&1; then alias cr='code . -r'; fi

# z command
if [ -e ~/.bash/bin/z.sh ]; then
    source ~/.bash/bin/z.sh

    if type fzf >/dev/null 2>&1; then
        __z() {
            if [[ -z "$*" ]]; then
                cd "$(z -lx 2>&1 | awk '{print $2}' | fzf +s --tac)"
                echo
            else
                _last_z_args="$@"
                z "$@"
            fi
        }

        zz() {
            cd "$(z -lx 2>&1 | awk '{print $2}' | fzf -q "$_last_z_args")"
        }
    fi
fi

[ -e ~/.bash/bin/git-completion.bash ] && source ~/.bash/bin/git-completion.bash
[ -e ~/.bash/bin/git-prompt.sh ] && source ~/.bash/bin/git-prompt.sh
[ -e ~/.bash/bin/yarn-completion.bash ] && source ~/.bash/bin/yarn-completion.bash
