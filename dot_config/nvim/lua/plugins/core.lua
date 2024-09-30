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
        bind_to_cwd = true,
      },
    },
  },
  {
    "folke/flash.nvim",
    keys = {
      {
        "s",
        mode = { "n", "x", "o" },
        function()
          require("flash").jump({ jump = { inclusive = false } })
        end,
        desc = "Flash",
      },
      {
        "<c-s>",
        mode = { "n", "x", "o" },
        function()
          require("flash").jump({ pattern = vim.fn.expand("<cword>") })
        end,
        desc = "Flash crt word",
      },
    },
  },
  {
    "neovim/nvim-lspconfig",
    opts = {
      inlay_hints = {
        enabled = false,
      },
      modes = {
        search = {
          enabled = true,
          highlight = {
            backdrop = true,
          },
        },
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
