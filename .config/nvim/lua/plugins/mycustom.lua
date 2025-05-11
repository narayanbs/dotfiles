return {
	-- colorschemes
	{ "navarasu/onedark.nvim", opts = { style = "warmer" } },
	-- {
	--   "cpea2506/one_monokai.nvim",
	--   opts = {
	--     colors = {
	--       green = "#89B170",
	--       aqua = "#9EBCE6",
	--       -- pink = "#ca4a7a",
	--       pink = "#E17477",
	--     },
	--     highlights = function(colors)
	--       return {
	--         Identifier = { fg = colors.aqua },
	--         Structure = { fg = colors.aqua },
	--         Type = { fg = colors.aqua },
	--         ["@keyword.type"] = { fg = colors.pink },
	--         ["@variable.parameter"] = { fg = colors.fg },
	--         ["@lsp.type.parameter"] = { fg = colors.fg },
	--         ["@lsp.type.typeParameter"] = { fg = colors.fg },
	--         ["@variable.builtin"] = { fg = colors.aqua },
	--         ["@type.builtin"] = { fg = colors.aqua },
	--       }
	--     end,
	--   },
	-- },

	-- Load the colorscheme
	{
		"LazyVim/LazyVim",
		opts = { colorscheme = "onedark" },
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
				"zig",
			},
		},
	},

	-- lsp configuration
	{
		"neovim/nvim-lspconfig",
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
				zls = {},
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
	-- enable to prevent highlighting of words under cursor
	--{ "snacks.nvim", opts = { words = { enabled = false } } },
}
