return {
  {
    "neovim/nvim-lspconfig",
    opts = function(_, opts)
      opts.servers = opts.servers or {}
      
      -- Disable ruff
      opts.servers.ruff_lsp = {
        enabled = false,
      }
      
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
      
      -- Python server configuration with comprehensive pycodestyle disabling
      opts.servers.pylsp = {
        settings = {
          pylsp = {
            plugins = {
              -- Disable pycodestyle completely
              pycodestyle = {
                enabled = false,
                ignore = {},
                maxLineLength = 999,
              },
              -- Also disable related linting plugins that might show similar warnings
              mccabe = {
                enabled = false,
              },
              pyflakes = {
                enabled = false,
              },
              -- You might also want to configure other plugins
              autopep8 = {
                enabled = false,
              },
              yapf = {
                enabled = false,
              },
            },
          },
        },
      }
      
      -- Pyright server configuration
      opts.servers.pyright = {
        settings = {
          python = {
            analysis = {
              reportOptionalMemberAccess = false,
            },
          },
        },
      }
      
      return opts
    end,
  },
}
