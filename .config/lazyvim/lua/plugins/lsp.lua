return {
	-- LSP
	{
		"neovim/nvim-lspconfig",
		dependencies = {
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",
		},
		event = "BufWinEnter",
		config = function()
			require("narayan.lsp")
		end,
	}, 
	{
		"williamboman/mason.nvim",
		cmd = {
			"Mason",
			"MasonInstall",
			"MasonUninstall",
			"MasonUninstallAll",
			"MasonLog",
		},
		init = function()
			vim.tbl_map(function(plugin)
				pcall(require, plugin)
			end, { "lspconfig", "null-ls" })
		end,
	},
	 -- for formatters and linters
	{
		"jose-elias-alvarez/null-ls.nvim",
		dependencies = { "RRethy/vim-illuminate" },
	},
}
