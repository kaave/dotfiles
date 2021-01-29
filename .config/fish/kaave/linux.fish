# vim
if type -q nvim
    alias vi nvim
    alias vim nvim

    set -x MANPAGER "col -b -x|env LANG=ja_JP.UTF-8 nvim -R -c 'set ft=man nolist nomod noma' -"
    set -x GIT_EDITOR "env LANG=ja_JP.UTF-8 nvim -f"
    set -x EDITOR 'nvim'
else if type -q vim
    alias vi vim
    alias view 'vim -R'

    export MANPAGER="col -b -x|vim -R -c 'set ft=man nolist nomod noma' -"
    set -x GIT_EDITOR "env LANG=ja_JP.UTF-8 vim -f"
    set -x EDITOR vim
end

# copy to clipboard
if type -q xsel
    alias pbcopy 'xsel --clipboard --input'
    alias pbpaste 'xsel --clipboard --output'
end
