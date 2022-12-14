local ensure_packer = function()
	local fn = vim.fn
	local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
	if fn.empty(fn.glob(install_path)) > 0 then
		fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path })
		vim.cmd([[packadd packer.nvim]])
		return true
	end
	return false
end

local packer_bootstrap = ensure_packer()

vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])

-- Install your plugins here
return require("packer").startup({
	function(use)
		-- Essential plugins
		use({ "wbthomason/packer.nvim", commit = "6afb67460283f0e990d35d229fd38fdc04063e0a" }) -- Have packer manage itself
		use({ "nvim-lua/plenary.nvim", commit = "4b7e52044bbb84242158d977a50c4cbcd85070c7" }) -- Useful lua functions used by lots of plugins
				
		use({ "nvim-telescope/telescope.nvim", commit = "7a4ffef931769c3fe7544214ed7ffde5852653f6" }) -- Telescope
		use({ "nvim-tree/nvim-tree.lua" }) -- file explorer
		use({ "nvim-tree/nvim-web-devicons" }) -- vscode like icons
		use({ "nvim-lualine/lualine.nvim", commit = "3325d5d43a7a2bc9baeef2b7e58e1d915278beaf" }) -- status line
		use({ "akinsho/bufferline.nvim", commit = "7c07dee2714778a84a9adda6e676c8e2151085f2" }) -- line seperating buffers
		use({ "lukas-reineke/indent-blankline.nvim", commit = "db7cbcb40cc00fc5d6074d7569fb37197705e7f6" }) -- highlight indents
		use({ "goolord/alpha-nvim", commit = "0bb6fc0646bcd1cdb4639737a1cee8d6e08bcc31" }) -- home screen
		use({ "christoomey/vim-tmux-navigator", commit = "c2dab181185101070b0ad6c33451f4e2f56a446a" }) -- tmux and split window navigation
		
		-- Colorschemes
		use({ "folke/tokyonight.nvim", commit = "ec144d94a8dbd9c8b4f5e50d933d67a37f589ed8" })
		use({ "rmehri01/onenord.nvim", commit = "0cd9f681bee019715bfbe928891579a3af3331e8" })
		use({ "EdenEast/nightfox.nvim" })
		use({ "narayanbs/kanagawa.nvim" })
		use({ "ellisonleao/gruvbox.nvim" })

		-- Treesitter
		use({
			"nvim-treesitter/nvim-treesitter",
			run = function()
				local ts_update = require("nvim-treesitter.install").update({ with_sync = true })
				ts_update()
			end,
			commit = "47bda4171aad2ee990a35ddb6319ceedc4d78b5d",
		})

		-- cmp plugins
		use({ "hrsh7th/nvim-cmp", commit = "c53dd36adcf512611fa7c523fced55447bfdbfa5" }) -- The completion plugin
		use({ "hrsh7th/cmp-buffer", commit = "3022dbc9166796b644a841a02de8dd1cc1d311fa" }) -- buffer completions
		use({ "hrsh7th/cmp-path", commit = "91ff86cd9c29299a64f968ebb45846c485725f23" }) -- path completions
		use({ "saadparwaiz1/cmp_luasnip", commit = "18095520391186d634a0045dacaa346291096566" }) -- snippet completions
		use({ "hrsh7th/cmp-nvim-lsp", commit = "78924d1d677b29b3d1fe429864185341724ee5a2" })
		use({ "hrsh7th/cmp-nvim-lua", commit = "d276254e7198ab7d00f117e88e223b4bd8c02d21" })

		-- snippets
		use({ "L3MON4D3/LuaSnip", commit = "619796e2477f7233e5fdff456240676a08482684" }) --snippet engine
		use({ "rafamadriz/friendly-snippets", commit = "c93311fbcc840210a2c0db574177d84a35a2c9c1" }) -- a bunch of snippets to use

		-- LSP		
		use({ "neovim/nvim-lspconfig", commit = "c96ec574eacfff8ad8dd4bdb6e96a1b3dbd268fd" }) -- enable LSP
		use({ "williamboman/mason.nvim", commit = "d85d71e910d1b2c539d17ae0d47dad48f8f3c8a7" })
		use({ "williamboman/mason-lspconfig.nvim", commit = "a910b4d50f7a32d2f9057d636418a16843094b7c" })
		use({ "jose-elias-alvarez/null-ls.nvim", commit = "07d4ed4c6b561914aafd787453a685598bec510f" }) -- for formatters and linters
		use({ "RRethy/vim-illuminate", commit = "a6d0b28ea7d6b9d139374be1f94a16bd120fcda3" })


		-- utilities
		
		-- Auto match pairs, integrates with cmp and treesitter
		use({ "windwp/nvim-autopairs", commit = "6b6e35fc9aca1030a74cc022220bc22ea6c5daf4" })  
		-- auto close tags automatically /uses treesitter
		use({ "windwp/nvim-ts-autotag", commit = "fdefe46c6807441460f11f11a167a2baf8e4534b" }) 
		use({ "numToStr/Comment.nvim", commit = "ad7ffa8ed2279f1c8a90212c7d3851f9b783a3d6" }) -- comment plugin
		-- comment strings based on cursor location / uses treesitter
		use({ "JoosepAlviste/nvim-ts-context-commentstring", commit = "32d9627123321db65a4f158b72b757bcaef1a3f4" }) 

		use({ "moll/vim-bbye", commit = "25ef93ac5a87526111f43e5110675032dbcacf56" })  -- buffer utility 
		use({ "akinsho/toggleterm.nvim", commit = "3ba683827c623affb4d9aa518e97b34db2623093" }) -- toggle terminal 
		use({ "ahmedkhalf/project.nvim", commit = "685bc8e3890d2feb07ccf919522c97f7d33b94e4" }) -- for :Telescope Projects
		use({ "lewis6991/impatient.nvim", commit = "b842e16ecc1a700f62adb9802f8355b99b52a5a6" }) -- speedup neovim
		
		-- Git
		use({ "lewis6991/gitsigns.nvim", commit = "9ff7dfb051e5104088ff80556203634fc8f8546d" })

		-- DAP
		use({ "mfussenegger/nvim-dap", commit = "61643680dcb771a29073cd432894e2f81a7c2ae3" })
		use({ "rcarriga/nvim-dap-ui", commit = "d7a9f032e7e45b37d778ef83e3d412566ba97cb5" })
		use({ "ravenxrz/DAPInstall.nvim", commit = "8798b4c36d33723e7bba6ed6e2c202f84bb300de" })
	

		-- Automatically set up your configuration after cloning packer.nvim
		-- Put this at the end after all plugins
		if packer_bootstrap then
			require("packer").sync()
		end
	end,
	config = {
		display = {
			open_fn = function()
				return require("packer.util").float({ border = "rounded" })
			end,
		},
	},
})
