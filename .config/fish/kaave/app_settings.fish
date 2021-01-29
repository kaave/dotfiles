if type -q docker
    alias dk 'docker'
    alias dkc 'docker-compose'
    alias dl "docker ps -l -q"
    alias dps "docker ps"
    alias dpa "docker ps -a"
    alias di "docker images"
    alias dip "docker inspect --format '{{ .NetworkSettings.IPAddress }}'"
    alias dkd "docker run -d -P"
    alias dki "docker run -i -t -P"
    alias dex "docker exec -i -t"

    function dstop
        docker stop (docker ps -a -q)
    end

    function dstop
        docker stop (docker ps -a -q)
    end

    function drm
        docker rm (docker ps -a -q)
    end

    alias drmf 'docker stop (docker ps -a -q) and docker rm (docker ps -a -q)'

    function dri
        docker rmi (docker images -q)
    end

    function dbu
        docker build -t=$1 .
    end

    function dalias
        alias | grep 'docker' | sed "s/['|\']//g" | sed "s/^alias //g" | sed "s/ / => /"| sort
    end

    function dbash
        docker exec -it (docker ps -aqf "name=$1") bash
    end
end

# vagrant
if type -q vagrant
    alias vg 'vagrant'
    # vagrant up & vagrant ssh
    alias vgus 'vagrant up; vagrant ssh'
end

# composer
if test -d ~/.composer
    set -x PATH ~/.composer/vendor/bin $PATH
end

# python
if type -q python
    alias venv 'python3 -m venv'
end

if type -q pipenv
    set -x PIPENV_VENV_IN_PROJECT 1
    alias pe 'pipenv'
    alias peg 'pipenv graph'
    alias pei 'pipenv install'
    alias pel 'pipenv lock'
    alias peo 'pipenv open'
    alias per 'pipenv run'
    alias pes 'pipenv shell'
    alias peu 'pipenv update'
    alias peui 'pipenv uninstall'
    function palias
        alias | grep 'pipenv' | sed "s/['|\']//g" | sed "s/^alias //g" | sed "s/ / => /"| sort
    end
    eval (pipenv --completion)
end

# Ruby
if type -q bundle
    alias be 'bundle exec'
    alias binit 'bundle install --path=vendor/bundle -j4'
end

# Go
if type -q go
    set -x GOPATH_ROOT $HOME/Projects/go
    set -x GOPATH_THIRD_PARTY $GOPATH_ROOT/third-party
    set -x GOPATH_MY_PROJECT $GOPATH_ROOT/my-project

    if test -d $GOPATH_ROOT
    else
        mkdir -p $GOPATH_ROOT
    end

    if test -d $GOPATH_ROOT/src
    else
        mkdir -p $GOPATH_ROOT/src
    end

    if test -d $GOPATH_ROOT/pkg
    else
        mkdir -p $GOPATH_ROOT/pkg
    end

    if test -d $GOPATH_ROOT/bin
    else
        mkdir -p $GOPATH_ROOT/bin
    end

    if test -d $GOPATH_THIRD_PARTY/bin
    else
        mkdir -p $GOPATH_THIRD_PARTY/bin
    end

    if test -d $GOPATH_MY_PROJECT/bin
    else
        mkdir -p $GOPATH_MY_PROJECT/bin
    end

    set -x GOROOT (go env GOROOT)
    set -x GOPATH $GOPATH_ROOT

    set -x PATH $GOPATH_ROOT/bin $PATH
    set -x PATH $GOPATH_THIRD_PARTY/bin $PATH
    set -x PATH $GOPATH_MY_PROJECT/bin $PATH
end

# haskell
if type -q stack
    alias ghc 'stack ghc --'
    alias ghci 'stack ghci --'
    alias runghc 'stack runghc --'
    alias runhaskell 'stack runhaskell --'
end

# editor
if type -q code
    alias cr 'code . -r'
end
