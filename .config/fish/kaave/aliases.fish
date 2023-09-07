#
# aliases
#
if type -q htop
    alias top htop
end

if type -q hub
    alias git hub
end

if type -q lsd
    alias ls lsd
else
    set -x CLICOLOR 1
    set -x LSCOLORS gxfxcxdxbxegedabagacad
    alias ls "ls -G -F"
end

if type -q bat
    alias cat bat
end

if type -q amm
    alias amm "bash -c amm"
end

# グローバルエイリアス
# alias -g L='| less'
# alias -g G='| grep'
# alias -g M='| more'

# C で標準出力をクリップボードにコピーする
# echo 'foobar' C # という感じ
# mollifier delta blog : http://mollifier.hatenablog.com/entry/20100317/p1
# if which pbcopy >/dev/null 2>&1 ; then
#     # Mac
#     alias -g C='| pbcopy'
# elif which xsel >/dev/null 2>&1 ; then
#     # Linux
#     alias -g C='| xsel --input --clipboard'
# elif which putclip >/dev/null 2>&1 ; then
#     # Cygwin
#     alias -g C='| putclip'
# fi

function gi
    curl -L -s https://www.gitignore.io/api/$argv
end

function ip-info
    curl -L -s https://ipinfo.io/
end

if type -q ffmpeg
    function giffy
        ffmpeg -i $argv -r 20 (echo $argv | sed -E 's/\.mov$/.gif/')
    end

    function mp4fy
        ffmpeg -i $argv -vcodec libx264 -pix_fmt yuv420p -vf "scale=trunc(iw/2)*2:trunc(ih/2)*2" -an -crf 26 (echo $argv | sed -E 's/\.[a-zA-Z0-9]*$/.mp4/')
    end
end

# char aliases
# alias a
alias b bundle
alias c cat
# alias d
alias e emacs
# alias f
alias g git
# alias h
# alias i
# alias j
# alias k
# alias l
alias m make
alias n node
alias o open
# alias p
# alias q
# alias r
alias s stack
# alias t
# alias u
alias v vagrant
# alias w
# alias x
alias y yarn
# alias z

function charalias
    alias | grep 'alias . ' | sed "s/['|\']//g" | sed "s/^alias //g" | sed "s/ /: /"| sort
end
