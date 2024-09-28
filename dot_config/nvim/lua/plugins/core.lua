return {
  -- Configure LazyVim to load gruvbox
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "catppuccin",
    },
  },
  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        yaml = { "prettier" },
        json = { "prettier" },
        javascript = { "prettier" },
        typescript = { "prettier" },
        typescriptreact = { "prettier" },
        rust = { "rustfmt", lsp_format = "fallback" },
      },
      formatters = {
        prettier = {
          options = {},
        },
      },
    },
  },
  {
    "nvim-neo-tree/neo-tree.nvim",
    opts = {
      filesystem = {
        bind_to_cwd = true,
        follow_current_file = {
          enabled = false,
        },
      },
    },
  },
  {
    "neovim/nvim-lspconfig",
    opts = {
      inlay_hints = {
        enabled = false,
      },
      servers = {
        vtsls = {
          settings = {
            typescript = {
              workspaceSymbols = {
                scope = "currentProject",
              },
              tsserver = {
                maxTsServerMemory = 8000,
              },
            },
          },
        },
      },
    },
  },
}
