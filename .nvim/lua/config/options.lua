-- ================================
-- Neovim Options Configuration
-- ================================

local opt = vim.opt

-- General settings
opt.encoding = "utf-8"
opt.fileencoding = "utf-8"
opt.mouse = "a"
opt.clipboard = "unnamedplus"

-- Display
opt.number = true
opt.relativenumber = false
opt.signcolumn = "yes"
opt.colorcolumn = "80"
opt.cursorline = true
opt.wrap = false
opt.scrolloff = 8
opt.sidescrolloff = 8

-- Indentation
opt.tabstop = 4
opt.shiftwidth = 4
opt.expandtab = true
opt.smartindent = true
opt.autoindent = true

-- Search
opt.hlsearch = true
opt.incsearch = true
opt.ignorecase = true
opt.smartcase = true

-- Splits
opt.splitbelow = true
opt.splitright = true

-- Backup and swap
opt.backup = false
opt.writebackup = false
opt.swapfile = false
opt.undofile = true

-- Completion
opt.completeopt = "menu,menuone,noselect"
opt.pumheight = 10

-- Performance
opt.updatetime = 300
opt.timeoutlen = 500

-- Terminal colors
opt.termguicolors = true

-- Show whitespace
opt.list = true
opt.listchars = { tab = "▸ ", trail = "·", nbsp = "␣" }

-- Folding
opt.foldmethod = "expr"
opt.foldexpr = "nvim_treesitter#foldexpr()"
opt.foldenable = false

-- Window title
opt.title = true
opt.titlestring = "nvim - %t"