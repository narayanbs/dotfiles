return {
	{ "AlexvZyl/nordic.nvim" },
	{ "narayanbs/mylake.nvim" },
	{ "rrethy/base16-nvim" },
	{ "daschw/leaf.nvim", opts = { contrast = "low" } },
	{
		"ellisonleao/gruvbox.nvim", -- theme
		opts = {
			bold = true,
			palette_overrides = {
				bright_green = "#b8bb26",
				bright_red = "#fb4934",
				bright_orange = "#d65d0e",
				bright_yellow = "#fabd2f",
			},
			overrides = {
				Function = { fg = "#83a598" },
			},
		},
	},
	{
		"sainnhe/sonokai",
		config = function()
			if vim.opt.termguicolors:get() then
				vim.opt.termguicolors = false
			end
			vim.cmd("colorscheme sonokai")
		end,
	},
}
