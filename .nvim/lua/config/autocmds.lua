-- ================================
-- Neovim Autocommands Configuration
-- ================================

local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

-- Highlight on yank
local highlight_group = augroup("YankHighlight", { clear = true })
autocmd("TextYankPost", {
  callback = function()
    vim.highlight.on_yank()
  end,
  group = highlight_group,
  pattern = "*",
})

-- Remove trailing whitespace on save
local trim_whitespace = augroup("TrimWhitespace", { clear = true })
autocmd("BufWritePre", {
  callback = function()
    local save_cursor = vim.fn.getpos(".")
    vim.cmd([[%s/\s\+$//e]])
    vim.fn.setpos(".", save_cursor)
  end,
  group = trim_whitespace,
  pattern = "*",
})

-- Auto-create directories when saving files
local auto_mkdir = augroup("AutoMkdir", { clear = true })
autocmd("BufWritePre", {
  callback = function()
    local dir = vim.fn.expand("<afile>:p:h")
    if vim.fn.isdirectory(dir) == 0 then
      vim.fn.mkdir(dir, "p")
    end
  end,
  group = auto_mkdir,
  pattern = "*",
})

-- File type specific settings
local filetype_group = augroup("FileTypeSettings", { clear = true })

-- Web development
autocmd("FileType", {
  pattern = { "html", "css", "scss", "javascript", "typescript", "json", "yaml", "lua" },
  callback = function()
    vim.opt_local.tabstop = 2
    vim.opt_local.shiftwidth = 2
  end,
  group = filetype_group,
})

-- Go
autocmd("FileType", {
  pattern = "go",
  callback = function()
    vim.opt_local.tabstop = 4
    vim.opt_local.shiftwidth = 4
    vim.opt_local.expandtab = false
  end,
  group = filetype_group,
})

-- Python
autocmd("FileType", {
  pattern = "python",
  callback = function()
    vim.opt_local.tabstop = 4
    vim.opt_local.shiftwidth = 4
    vim.opt_local.colorcolumn = "88"
  end,
  group = filetype_group,
})

-- Terminal settings
local terminal_group = augroup("Terminal", { clear = true })
autocmd("TermOpen", {
  callback = function()
    vim.opt_local.number = false
    vim.opt_local.relativenumber = false
    vim.opt_local.signcolumn = "no"
  end,
  group = terminal_group,
  pattern = "*",
})

-- Auto resize splits when window is resized
local resize_group = augroup("ResizeSplits", { clear = true })
autocmd("VimResized", {
  callback = function()
    vim.cmd("tabdo wincmd =")
  end,
  group = resize_group,
})

-- Close certain filetypes with 'q'
local close_with_q = augroup("CloseWithQ", { clear = true })
autocmd("FileType", {
  pattern = { "help", "man", "qf", "lspinfo", "checkhealth" },
  callback = function(event)
    vim.bo[event.buf].buflisted = false
    vim.keymap.set("n", "q", "<cmd>close<cr>", { buffer = event.buf, silent = true })
  end,
  group = close_with_q,
})