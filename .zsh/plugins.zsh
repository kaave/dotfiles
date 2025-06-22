#!/usr/bin/env zsh
# Plugin management
# This file handles zsh plugin loading with zinit

ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"
[ ! -d $ZINIT_HOME ] && mkdir -p "$(dirname $ZINIT_HOME)"
[ ! -d $ZINIT_HOME/.git ] && git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
source "${ZINIT_HOME}/zinit.zsh"

zinit load 'zsh-users/zsh-autosuggestions'
zinit load 'zsh-users/zsh-completions'
zinit load 'zsh-users/zsh-syntax-highlighting'
