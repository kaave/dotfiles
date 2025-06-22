# Neovim Configuration

Modern Neovim configuration using lazy.nvim plugin manager and Lua.

## Features

- **Plugin Manager**: lazy.nvim with automatic plugin management
- **Colorscheme**: Solarized Dark theme with winter variant
- **LSP Support**: Full LSP integration with Mason for package management
- **Autocompletion**: nvim-cmp with multiple sources
- **Syntax Highlighting**: Treesitter for advanced syntax highlighting
- **File Management**: Neo-tree file explorer and Telescope fuzzy finder
- **Git Integration**: Gitsigns for git hunks and status
- **Terminal**: Integrated terminal with ToggleTerm
- **Modern UI**: Status line, buffer line, and dashboard

## Installation

1. Backup your existing Neovim configuration:
   ```bash
   mv ~/.config/nvim ~/.config/nvim.backup
   ```

2. Create symlink from dotfiles:
   ```bash
   ln -sf /path/to/dotfiles/.config/nvim ~/.config/nvim
   ```

3. Start Neovim and lazy.nvim will automatically install plugins:
   ```bash
   nvim
   ```

## Key Mappings

### General
- `<leader>` is set to space
- `<leader>e` - Toggle file explorer
- `<leader>ff` - Find files
- `<leader>fg` - Live grep
- `<leader>fb` - Find buffers

### LSP
- `gd` - Go to definition
- `K` - Show hover information
- `<leader>rn` - Rename symbol
- `<leader>ca` - Code actions
- `gr` - Go to references

### Git
- `]h` / `[h` - Next/previous git hunk
- `<leader>ghs` - Stage hunk
- `<leader>ghr` - Reset hunk
- `<leader>ghp` - Preview hunk

### Terminal
- `<C-\>` - Toggle terminal
- `<leader>tt` - Toggle terminal
- `<leader>tf` - Toggle floating terminal

## Configuration Structure

```
.config/nvim/
├── init.lua                 # Main entry point
├── lua/
│   ├── config/
│   │   ├── autocmds.lua    # Auto commands
│   │   ├── keymaps.lua     # Key mappings
│   │   ├── lazy.lua        # Plugin manager setup
│   │   └── options.lua     # Editor options
│   └── plugins/
│       ├── coding.lua      # Coding enhancement plugins
│       ├── colorscheme.lua # Color scheme configuration
│       ├── editor.lua      # Editor enhancement plugins
│       ├── lsp.lua         # LSP configuration
│       └── ui.lua          # UI plugins
└── README.md               # This file
```

## Migration from Vim/Dein

This configuration replaces the old Vim setup with Dein. Key improvements:

- Lua-based configuration for better performance
- Lazy loading for faster startup
- Modern plugin ecosystem
- Better LSP integration
- Tree-sitter syntax highlighting
- Improved autocomplete and snippets

## Customization

To customize this configuration:

1. Edit files in `lua/config/` for core settings
2. Add/modify plugins in `lua/plugins/`
3. All changes will be automatically loaded on next Neovim start