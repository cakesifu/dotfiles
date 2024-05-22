-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
local map = vim.keymap.set
local unmap = vim.keymap.del

-- yank/past to/from global register
map("n", "\\y", '"+y', { desc = "yank to + register" })
map("n", "\\p", '"+p', { desc = "paste (after cursor) from + register" })
map("n", "\\P", '"+P', { desc = "paste (before cursor) from + register" })
