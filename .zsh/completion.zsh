#!/usr/bin/env zsh
# Completion configuration
# This file contains all completion-related settings

# Initialize completion system
# Already loaded in compinit.zsh

# pipenv completion
if command -v pipenv >/dev/null 2>&1; then
    eval "$(pipenv --completion)"
fi

# npm completion  
if command -v npm >/dev/null 2>&1; then
    eval "$(npm completion)"
fi

# GitHub CLI completion
if command -v gh >/dev/null 2>&1; then
    eval "$(gh completion -s zsh)"
fi

# aws-cli completion
if command -v aws_completer >/dev/null 2>&1; then
    # Use zsh completion style for aws
    autoload bashcompinit && bashcompinit
    complete -C aws_completer aws
fi

# kubectl completion
if command -v kubectl >/dev/null 2>&1; then
    source <(kubectl completion zsh)
fi

# docker completion
if command -v docker >/dev/null 2>&1; then
    # Docker completion is usually handled by the plugin system
    :
fi

# Additional completion settings
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' menu select
zstyle ':completion:*' group-name ''
zstyle ':completion:*:descriptions' format '%B%d%b'