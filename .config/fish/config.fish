source ~/.config/fish/kaave/global.fish
source ~/.config/fish/kaave/app_settings.fish
source ~/.config/fish/kaave/aliases.fish
source ~/.config/fish/kaave/key_bind.fish

# anyenv
if test -d ~/.anyenv
    set -x PATH $HOME/.anyenv/bin $PATH
    eval (anyenv init - fish | source)
end

# asdf
if test -d ~/.asdf
    source ~/.asdf/asdf.fish
end

switch (uname)
    case Linux
        source ~/.config/fish/kaave/linux.fish
    case Darwin
        source ~/.config/fish/kaave/mac.fish
    case FreeBSD NetBSD DragonFly
        source ~/.config/fish/kaave/linux.fish
    case '*'
        echo Hi, stranger!
end

# prompt
# Fish git prompt
set __fish_git_prompt_showdirtystate 'yes'
set __fish_git_prompt_showstashstate 'yes'
set __fish_git_prompt_showuntrackedfiles 'yes'
set __fish_git_prompt_showupstream 'yes'
set __fish_git_prompt_color_branch yellow
set __fish_git_prompt_color_upstream_ahead green
set __fish_git_prompt_color_upstream_behind red

# Status Chars
set __fish_git_prompt_char_dirtystate '#'
set __fish_git_prompt_char_stagedstate '>'
set __fish_git_prompt_char_untrackedfiles '☡'
set __fish_git_prompt_char_stashstate '<'
set __fish_git_prompt_char_upstream_ahead '+'
set __fish_git_prompt_char_upstream_behind '-'

set -g fish_prompt_pwd_dir_length 3
function fish_prompt --description 'Write out the prompt'
    switch (uname)
        case Linux
            set fish_color_cwd magenta
    end

    if [ $status -eq 0 ]
        printf '%s%s%s %s%s' (set_color $fish_color_cwd) (prompt_pwd) (set_color white) (echo \%) (set_color normal)
    else
        printf '%s%s%s %s%s' (set_color $fish_color_cwd) (prompt_pwd) (set_color red) (echo \%) (set_color normal)
    end

    # Git
    set last_status $status
    printf '%s ' (__fish_git_prompt)
    set_color normal
end

if type -q direnv
    direnv hook fish | source
end
