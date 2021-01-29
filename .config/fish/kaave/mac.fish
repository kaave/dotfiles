# Vim
if type -q nvim
    alias vi nvim
    alias vim nvim
    alias vimdiff 'nvim -d '

    set -x MANPAGER "col -b -x|env LANG=ja_JP.UTF-8 nvim -R -c 'set ft=man nolist nomod noma' -"
    set -x GIT_EDITOR "env LANG=ja_JP.UTF-8 nvim -f"
    set -x EDITOR 'nvim'
else if test -d /Applications/MacVim.app
    set -x MACVIM_PATH /Applications/MacVim.app/Contents/MacOS
    alias vim "env LANG=ja_JP.UTF-8 $MACVIM_PATH/Vim "'"$@"'
    alias vi vim
    alias vimdiff $MACVIM_PATH/vimdiff
    alias view $MACVIM_PATH/view

    set -x MANPAGER "col -b -x|env LANG=ja_JP.UTF-8 $MACVIM_PATH/Vim -R -c 'set ft=man nolist nomod noma' -"
    set -x GIT_EDITOR "env LANG=ja_JP.UTF-8 $MACVIM_PATH/Vim -f"
    set -x EDITOR 'vim'
end

# Emacs
if test -d /Applications/Emacs.app
    alias emacs "/Applications/Emacs.app/Contents/MacOS/Emacs -nw --"
end

# GCP
if test -d /usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/completion.fish.inc
    /usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/completion.fish.inc
end

if test -d /usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.fish.inc
    /usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.fish.inc
end

# SourceTree
if test -d /Applications/SourceTree.app
    alias sourcetree "open -a SourceTree"
end

# change some default apps
if type -q gsed
    alias sed gsed
end

if type -q icdiff
    alias diff icdiff
end

set -x GNU_BIN /usr/local/opt/gnu-tar/libexec/gnubin
if test -d $GNU_BIN
    set -x PATH $GNU_BIN $PATH
end

set -x FLUTTER_BIN ~/dev/flutter/bin
if test -d $FLUTTER_BIN
    set -x PATH $FLUTTER_BIN $PATH
end

# add Marked command if Marked installed
if test -d '/Applications/Marked 2.app'
    alias mark 'open -a "Marked 2"'
end

# add diff-hightlight
set -x DIFF_HIGHLIGHT /usr/local/share/git-core/contrib/diff-highlight
if test -d $DIFF_HIGHLIGHT
    set -x PATH $DIFF_HIGHLIGHT $PATH
end

# add android emulator's path
if test -d ~/Library/Android/sdk/emulator
    set -x PATH ~/Library/Android/sdk/emulator $PATH
end

