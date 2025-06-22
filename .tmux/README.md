# Tmux Configuration Modules

This directory contains modular tmux configuration files for better organization and maintainability.

## File Structure

- **`core.conf`** - Core tmux settings (prefix key, escape time, terminal settings)
- **`plugins.conf`** - Plugin management and TPM configuration
- **`keybinds.conf`** - Key bindings and shortcuts
- **`colors.conf`** - Solarized Dark color scheme
- **`statusbar.conf`** - Status bar configuration and formatting
- **`macos.conf`** - macOS-specific settings (clipboard, shell)
- **`linux.conf`** - Linux-specific settings (clipboard, shell)

## Usage

The main `.tmux.conf` file loads these modules in the correct order:

1. Core settings
2. Key bindings  
3. Colors
4. Status bar
5. OS-specific settings
6. Plugins (last)

## Customization

To customize your tmux configuration:

1. Edit the relevant module file
2. Reload tmux configuration: `prefix + r` or `tmux source-file ~/.tmux.conf`

## Key Bindings

### Pane Operations
- **Split horizontal**: `prefix + |` or `Ctrl + \`
- **Split vertical**: `prefix + -` or `Ctrl + _`
- **Navigate panes**: `prefix + h/j/k/l` or `Alt + arrow keys`
- **Resize panes**: `prefix + H/J/K/L` (repeatable)

### Session Management
- **Reload config**: `prefix + r`
- **Copy mode**: `prefix + [`
- **Paste**: `prefix + ]`

### Copy Mode (Vi-style)
- **Start selection**: `v`
- **Copy selection**: `y`

## Plugin Management

Plugins are managed via TPM (Tmux Plugin Manager):

- **Install plugins**: `prefix + I`
- **Update plugins**: `prefix + U`
- **Remove plugins**: `prefix + alt + u`

## Dependencies

### macOS
- `reattach-to-user-namespace` for clipboard integration
- Homebrew zsh (preferred) or system zsh

### Linux  
- `xsel` or `xclip` for clipboard integration
- zsh (preferred) or bash fallback