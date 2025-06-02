return {
  {
    "neovim/nvim-lspconfig",
    opts = function(_, opts)
      opts.servers = opts.servers or {}
      
      -- TypeScript server configuration
      opts.servers.vtsls = {
        filetypes = { "typescript", "javascript", "typescriptreact", "javascriptreact" },
        settings = {
          typescript = {
            suggest = {
              autoImports = true,
              completeFunctionCalls = true,
            },
          },
        },
      }
      
      -- Python server configuration to ignore pycodestyle
      opts.servers.pylsp = {
        settings = {
          pylsp = {
            plugins = {
              pycodestyle = {
                enabled = false,
              },
            },
          },
        },
      }
      
      return opts
    end,
  },
}
