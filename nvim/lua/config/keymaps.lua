-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local keymap = vim.keymap

-- Quick save with 'ss' in normal mode
keymap.set("n", "ss", ":w<CR>", { desc = "Save file" })

-- Save and close buffer with 'sq' (save-quit)
keymap.set("n", "sq", ":w<CR>:bd<CR>", { desc = "Save and close buffer" })
