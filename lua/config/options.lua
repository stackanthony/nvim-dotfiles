-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
-- Turn off autoformat globally
--
-- vim.g.autoformat = false
-- Configure clipboard
vim.g.clipboard = {
  name = "xclip",
  copy = {
    ["+"] = "xclip -selection clipboard",
    ["*"] = "xclip -selection primary",
  },
  paste = {
    ["+"] = "xclip -selection clipboard -o",
    ["*"] = "xclip -selection primary -o",
  },
  cache_enabled = 1,
}
-- Turn off smooth scrolling
vim.opt.smoothscroll = false
-- Define filetypes that should have autoformat enabled
local autoformat_filetypes = {
  "javascript",
  "typescript", 
  "javascriptreact",
  "typescriptreact",
  "terraform"
}

-- Enable autoformat only for specified filetypes
vim.api.nvim_create_autocmd("FileType", {
  pattern = autoformat_filetypes,
  callback = function()
    vim.b.autoformat = true
  end,
})
