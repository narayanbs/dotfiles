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
    "neanias/everforest-nvim",
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
        -- These servers will be automatically installed by mason and loaded with lspconfig
        pyright = {},
        gopls = {},
        tsserver = {},
        tailwindcss = {},
        emmet_ls = {},
      },
    },
  },

  -- formatters configuration
  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        lua = { "stylua" },
        python = { "isort", "black" },
        go = { "goimports", "gofmt" },
        javascript = { "prettierd" },
        typescript = { "prettierd" },
        javascriptreact = { "prettierd" },
        typescriptreact = { "prettierd" },
        css = { "prettierd" },
        html = { "prettierd" },
        json = { "prettierd" },
        yaml = { "prettierd" },
        markdown = { "prettierd" },
        graphql = { "prettierd" },
      },
    },
  },
  -- colorizer for css/tailwind
  {
    "NvChad/nvim-colorizer.lua",
    opts = {
      user_default_options = {
        tailwind = true,
      },
    },
  },
  -- Zenmode for focussed writing/coding
  {
    "folke/zen-mode.nvim",
    keys = function()
	    return {
		    {"<leader>zm", "<cmd>ZenMode<cr>", desc="Zen Mode Toggle"},
	    }
    end,
    opts = {},
  },
}
