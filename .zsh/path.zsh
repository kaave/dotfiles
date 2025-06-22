#!/usr/bin/env zsh
# PATH configuration
# This file centralizes all PATH-related settings

# pnpm
if [[ -d ~/Library/pnpm ]]; then
    export PNPM_HOME="~/Library/pnpm"
    case ":$PATH:" in
      *":$PNPM_HOME:"*) ;;
      *) export PATH="$PNPM_HOME:$PATH" ;;
    esac
fi

# Composer
[[ -d ~/.composer/vendor/bin ]] && export PATH="$PATH:~/.composer/vendor/bin"

# Go
[[ -d $HOME/go ]] && export PATH="$PATH:$HOME/go/bin"

# Rust
[[ -d ~/.cargo/bin ]] && export PATH="$HOME/.cargo/bin:$PATH"

# Local binaries
[[ -d ~/.local/bin ]] && export PATH="$HOME/.local/bin:$PATH"

# anyenv
if [[ -d ~/.anyenv ]]; then
    export PATH="$HOME/.anyenv/bin:$PATH"
fi