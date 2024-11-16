return {
	{
		"folke/which-key.nvim",
		event = "VeryLazy",
	},
	{
		"echasnovski/mini.surround",
		version = false,
		config = function()
			require("mini.surround").setup({})
		end,
	},
}
