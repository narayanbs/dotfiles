return {
	-- colorschemes
	--{ "rrethy/base16-nvim" },
	{ "narayanbs/mylake.nvim" },
	{ "daschw/leaf.nvim", opts = { contrast = "low" } },
	{
		"ellisonleao/gruvbox.nvim", -- theme
		opts = {
			bold = false,
			-- palette_overrides = {
			--   bright_green = "#b8bb26",
			--   bright_red = "#fb4934",
			--   bright_orange = "#d65d0e",
			--   bright_yellow = "#fabd2f",
			-- },
			-- overrides = {
			--   Function = { fg = "#83a598" },
			-- },
		},
	},
	{ "navarasu/onedark.nvim", opts = { style = "warmer" } },
	{ "whizikxd/naysayer-colors.nvim" },
	-- Load the colorscheme
	{
		"LazyVim/LazyVim",
		opts = { colorscheme = "naysayer" },
	},
	-- neo-tree Configuration
	{
		"nvim-neo-tree/neo-tree.nvim",
		opts = {
			window = {
				width = 25,
			},
		},
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
			inlay_hints = { enabled = false },
			document_highlight = {
				enabled = false,
			},
			servers = {
				clangd = {
					mason = false,
				},
				-- These servers will be automatically installed by mason and loaded with lspconfig
				pyright = {},
				gopls = {},
				ts_ls = {},
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
				javascript = { "prettier" },
				typescript = { "prettier" },
				javascriptreact = { "prettier" },
				typescriptreact = { "prettier" },
				css = { "prettier" },
				html = { "prettier" },
				json = { "prettier" },
				yaml = { "prettier" },
				markdown = { "prettier" },
				graphql = { "prettier" },
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
				{ "<leader>zm", "<cmd>ZenMode<cr>", desc = "Zen Mode Toggle" },
			}
		end,
		opts = {},
	},
}
