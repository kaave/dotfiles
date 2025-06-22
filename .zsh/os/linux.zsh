# ================================
# Linux Distribution Detection
# ================================

# Detect Linux distribution
if [[ -f /etc/os-release ]]; then
    source /etc/os-release
    LINUX_DISTRO="$ID"
    LINUX_VERSION="$VERSION_ID"
elif [[ -f /etc/redhat-release ]]; then
    LINUX_DISTRO="redhat"
elif [[ -f /etc/debian_version ]]; then
    LINUX_DISTRO="debian"
else
    LINUX_DISTRO="unknown"
fi

export LINUX_DISTRO LINUX_VERSION

# ================================
# Distribution-specific settings
# ================================

case "$LINUX_DISTRO" in
    "ubuntu" | "debian")
        # fzf paths for Debian/Ubuntu
        if type fzf >/dev/null 2>&1; then
            if [[ -f /usr/share/doc/fzf/examples/key-bindings.zsh ]]; then
                source /usr/share/doc/fzf/examples/key-bindings.zsh
                source /usr/share/doc/fzf/examples/completion.zsh
            fi
        fi
        ;;
        
    "fedora" | "rhel" | "centos" | "rocky" | "alma")
        # Red Hat family specific settings
        ;;
        
    "arch" | "manjaro")
        # Arch family specific settings
        ;;
        
    "opensuse" | "sles")
        # openSUSE family specific settings
        ;;
esac

# ================================
# Common Linux settings
# ================================

PROMPT="%F{magenta}%d %(?,%F{white},%F{red})%#%f "

# vim/nvim setup
if command -v nvim >/dev/null 2>&1; then
    alias vi='nvim'
    alias vim='nvim'
    alias vimdiff='nvim -d'
    export GIT_EDITOR="env LANG=ja_JP.UTF-8 nvim -f"
    export EDITOR=nvim
elif command -v vim >/dev/null 2>&1; then
    export GIT_EDITOR="env LANG=ja_JP.UTF-8 vim -f"
    export EDITOR=vim
fi

# Clipboard utilities
if command -v xsel >/dev/null 2>&1; then
    alias pbcopy='xsel --clipboard --input'
    alias pbpaste='xsel --clipboard --output'
elif command -v xclip >/dev/null 2>&1; then
    alias pbcopy='xclip -selection clipboard'
    alias pbpaste='xclip -selection clipboard -o'
fi

# fzf setup (fallback paths)
if type fzf >/dev/null 2>&1; then
    # Try common fzf installation paths
    for fzf_path in \
        "/usr/share/fzf" \
        "/usr/local/share/fzf" \
        "$HOME/.fzf" \
        "/opt/homebrew/opt/fzf/shell" \
        "/usr/share/doc/fzf/examples"; do
        
        if [[ -f "$fzf_path/key-bindings.zsh" ]]; then
            source "$fzf_path/key-bindings.zsh"
            source "$fzf_path/completion.zsh"
            break
        fi
    done
fi

# X11 settings
if [[ -n "$DISPLAY" ]] && command -v xset >/dev/null 2>&1; then
    # Set key repeat rate
    xset r rate 200 40
fi

# Systemd is available on most modern Linux distributions
# Users can use standard systemctl commands as needed
