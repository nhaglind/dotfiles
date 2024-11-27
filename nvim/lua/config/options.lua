-- Options are automatically loaded before lazy.nvim startup
-- Default options: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

-- Automatically add newline at end of file
vim.opt.fixeol = true

-- Convert tabs to spaces
vim.opt.expandtab = true

-- Keep LazyVim's automatic formatting disabled
vim.g.autoformat = false

-- Disable undo files (stop unlimited undo across sessions)
vim.opt.undofile = false

-- Disable swap files
vim.opt.swapfile = false

-- Disable macro recording
vim.keymap.set("n", "q", "<nop>")
