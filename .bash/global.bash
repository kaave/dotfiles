# Default text editor
export EDITOR=vi

# Man command viewer
if type bat >/dev/null 2>&1; then export MANPAGER="col -b -x|bat -"; fi

# XDF configration
export XDG_CONFIG_HOME=$HOME/.config

# exec ls -l on changed directory
auto_cdls() {
    [ -n "$OLDPWD" ] && [ "$OLDPWD" != "$PWD" ] && ls -l; OLDPWD="$PWD";
}
PROMPT_COMMAND="$PROMPT_COMMAND"$'\n'auto_cdls

# needless cd
shopt -s autocd
# fix typo on cd
shopt -s cdspell
shopt -s dirspell

# complete on sudo
complete -cf sudo

# expand history buffar
HISTSIZE=100000

