return {
	-- colorschemes
	-- everforest
	{
		"sainnhe/everforest",
	},
	-- cyberdream
	{
		"scottmckendry/cyberdream.nvim",
	},
	-- kanagawa
	{
		"rebelot/kanagawa.nvim",
	},
	-- mellifluous
	{
		"ramojus/mellifluous.nvim",
	},
	-- darcula-dark
	{
		"xiantang/darcula-dark.nvim",
	},
	-- Configure LazyVim to load colorscheme
	{
		"LazyVim/LazyVim",
		opts = { colorscheme = "darcula-dark" },
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
				{ "<leader>zm", "<cmd>ZenMode<cr>", desc = "Zen Mode Toggle" },
			}
		end,
		opts = {},
	},
}
