return {
	{
		"mason-org/mason.nvim",
		opts = {},
	},
	{
		"mason-org/mason-lspconfig.nvim",
    opts = {
        ensure_installed = { "lua_ls", "gopls", "pyright", "emmet_language_server", "ts_ls" },
    },
    dependencies = {
        { "mason-org/mason.nvim", opts = {} },
	},
},
}
