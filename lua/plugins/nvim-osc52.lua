-- Using lazy.nvim
return {
  "ojroques/nvim-osc52",
  config = function()
    require("osc52").setup({
      max_length = 0, -- Maximum length of selection (0 for no limit)
      silent = false, -- Disable message on successful copy
      trim = false, -- Trim surrounding whitespaces before copy
      tmux_passthrough = true, -- Use tmux passthrough (>= tmux 3.2)
    })

    -- Copy to clipboard with leader+y
    vim.keymap.set("n", "<leader>y", require("osc52").copy_operator, { expr = true })
    vim.keymap.set("n", "<leader>yy", "<leader>y_", { remap = true })
    vim.keymap.set("v", "<leader>y", require("osc52").copy_visual)
  end,
}
