-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local keymap = vim.keymap

-- Quick save with 'ss' in normal mode
keymap.set("n", "ss", ":w<CR>", { desc = "Save file" })

-- Save and close buffer with 'sq' (save-quit)
keymap.set("n", "sq", ":w<CR>:bd<CR>", { desc = "Save and close buffer" })

-- Copy relative file path
keymap.set("n", "<leader>cy", function()
  local path = vim.fn.fnamemodify(vim.fn.expand("%"), ":.")
  vim.fn.setreg("+", path)
  vim.notify("Copied: " .. path)
end, { desc = "Copy relative file path" })

-- Copy absolute file path
keymap.set("n", "<leader>cY", function()
  local path = vim.fn.expand("%:p")
  vim.fn.setreg("+", path)
  vim.notify("Copied: " .. path)
end, { desc = "Copy absolute file path" })
