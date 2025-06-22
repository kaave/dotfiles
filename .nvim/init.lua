-- ================================
-- Neovim Configuration (Lua-based)
-- ================================
-- Modern Neovim setup with lazy.nvim plugin manager

-- Set leader key early
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Basic settings
require("config.options")
require("config.keymaps")
require("config.autocmds")

-- Plugin management with lazy.nvim
require("config.lazy")

-- Load colorscheme
vim.cmd.colorscheme("solarized")