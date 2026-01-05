-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
--- Open lazygit in new tmux window
----- Make all d+textobject combinations not yank
vim.keymap.set("n", "di", "\"_di", { desc = "Delete inside (no yank)" })
vim.keymap.set("n", "da", "\"_da", { desc = "Delete around (no yank)" })
