set -x LANG 'ja_JP.UTF-8'
set -x EDITOR 'vi'
set -x XDG_CONFIG_HOME ~/.config

# remove welcome message
set fish_greeting

function chpwd --on-variable PWD --description 'handler of changing $PWD'
    if not status --is-command-substitution ; and status --is-interactive
        ls -l
    end
end

# rustup
if test -d ~/.cargo/bin
    set -x PATH ~/.cargo/bin $PATH
end

if test -d ~/.local/bin
    set -x PATH ~/.local/bin $PATH
end

# Android
set -x ANDROID_HOME "$HOME/Library/Android/sdk"
if test -d $ANDROID_HOME
    set -x PATH $ANDROID_HOME/tools $PATH
    set -x PATH $ANDROID_HOME/tools/bin $PATH
    set -x PATH $ANDROID_HOME/platform-tools $PATH
    set -x PATH $ANDROID_HOME/emulator $PATH
end

# deno
if test -d ~/.deno/bin
    set -x PATH ~/.deno/bin $PATH
end
