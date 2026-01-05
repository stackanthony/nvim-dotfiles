-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
-- Turn off autoformat globally
--
vim.g.autoformat = false
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
  "terraform",
  "cpp",
  "hpp",
}

-- Enable autoformat only for specified filetypes
vim.api.nvim_create_autocmd("FileType", {
  pattern = autoformat_filetypes,
  callback = function()
    vim.b.autoformat = true
  end,
})

-- Auto-reload files when changed externally
vim.opt.autoread = true

-- Trigger autoread when files change on disk
vim.api.nvim_create_autocmd({ "FocusGained", "BufEnter", "CursorHold", "CursorHoldI" }, {
  pattern = "*",
  callback = function()
    if vim.fn.mode() ~= "c" then
      vim.cmd("checktime")
    end
  end,
})

-- Notification when file changes
vim.api.nvim_create_autocmd("FileChangedShellPost", {
  pattern = "*",
  callback = function()
    vim.notify("File changed on disk. Buffer reloaded.", vim.log.levels.WARN)
  end,
})
return {
  "nvim-telescope/telescope.nvim",
  opts = {
    -- defaults = {
    --   file_ignore_patterns = { "^.git/" }, -- still ignore .git folder
    -- },
    pickers = {
      find_files = {
        hidden = true, -- Show hidden files
        -- Or use this for more control:
        -- find_command = { "rg", "--files", "--hidden", "--glob", "!**/.git/*" },
      },
    },
  },
}
