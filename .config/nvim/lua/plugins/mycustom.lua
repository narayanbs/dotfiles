return {
  -- colorschemes
  -- gruvbox
  { "ellisonleao/gruvbox.nvim" },

  -- solarized-osaka
  {
    "craftzdog/solarized-osaka.nvim",
    opts = function()
      return { transparent = true }
    end,
  },
  {
    "neanias/everforest-nvim"
  },

  -- Configure LazyVim to load gruvbox
  {
    "LazyVim/LazyVim",
    opts = { colorscheme = "everforest" },
  },

  -- treesitter configuration
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "bash",
        "html",
        "javascript",
        "json",
        "lua",
        "markdown",
        "markdown_inline",
        "python",
        "tsx",
        "typescript",
        "go",
        "cpp",
        "rust",
      },
    },
  },

  -- lsp configuration
  {
    "neovim/nvim-lspconfig",
    ---@class PluginLspOpts
    opts = {
      servers = {
        clangd = {
          mason = false,
        },
        -- pyright will be automatically installed with mason and loaded with lspconfig
        pyright = {},
        gopls = {},
      },
    },
  },

  -- formatters configuration
  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        ["lua"] = { "stylua" },
        ["python"] = { "isort", "black" },
      },
    },
  },
}
