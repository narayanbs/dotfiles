return {
	{ "nvim-lua/plenary.nvim" },
	-- colorscheme
	{
		"rmehri01/onenord.nvim",
		lazy = false,
		priority = 1000,
		config = function()
			vim.cmd([[colorscheme onenord]])
		end,
	},
	{ "catppuccin/nvim", name = "catppuccin", event = "VeryLazy" },
	{ "EdenEast/nightfox.nvim", event = "VeryLazy" },
	{ "ellisonleao/gruvbox.nvim", event = "VeryLazy" },
	{ "narayanbs/kanagawa.nvim", event = "VeryLazy" },
	{ "folke/tokyonight.nvim", event = "VeryLazy" },

	{
		-- Telescope
		"nvim-telescope/telescope.nvim",
		dependencies = "nvim-lua/plenary.nvim",
		cmd = "Telescope",
		config = function()
			require("narayan.telescope")
		end,
	},
	{
		-- Treesitter
		"nvim-treesitter/nvim-treesitter",
		version = false,
		build = ":TSUpdate",
		event = "BufReadPost",
		config = function()
			require("narayan.treesitter")
		end,
	},
	-- file explorer
	{
		"nvim-neo-tree/neo-tree.nvim",
		dependencies = {
			"nvim-tree/nvim-web-devicons",
			"MunifTanjim/nui.nvim",
		},
		cmd = "Neotree",
		keys = {
			{
				"<leader>fe",
				function()
					require("neo-tree.command").execute({ toggle = true, dir = vim.loop.cwd() })
				end,
				desc = "Explorer NeoTree (cwd)",
			},
			{ "<leader>e", "<leader>fe", desc = "Explorer NeoTree (cwd)", remap = true },
		},
		deactivate = function()
			vim.cmd([[Neotree close]])
		end,
		init = function()
			vim.g.neo_tree_remove_legacy_commands = 1
			if vim.fn.argc() == 1 then
				local stat = vim.loop.fs_stat(vim.fn.argv(0))
				if stat and stat.type == "directory" then
					require("neo-tree")
				end
			end
		end,
		opts = {
			filesystem = {
				bind_to_cwd = false,
				follow_current_file = true,
			},
			window = {
				mappings = {
					["<space>"] = "none",
				},
			},
		},
	},
	{
		-- Lua line
		"nvim-lualine/lualine.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons", opt = true },
		event = "BufWinEnter",
		opts = function()
			require("narayan.lualine")
		end,
	},
	-- buffer line
	{
		"akinsho/bufferline.nvim",
		event = "VeryLazy",
		opts = {
			options = {
				always_show_bufferline = false,
				offsets = {
					{
						filetype = "neo-tree",
						text = "Neo-tree",
						highlight = "Directory",
						text_align = "left",
					},
				},
			},
		},
	},
	-- buffer remove
  {
    "echasnovski/mini.bufremove",
    -- stylua: ignore
    keys = {
      { "<leader>bd", function() require("mini.bufremove").delete(0, false) end, desc = "Delete Buffer" },
      { "<leader>bD", function() require("mini.bufremove").delete(0, true) end, desc = "Delete Buffer (Force)" },
    },
  },
	{
		"echasnovski/mini.indentscope",
		version = false, -- wait till new 0.7.0 release to put it back on semver
		event = "BufReadPre",
		opts = {
			-- symbol = "▏",
			symbol = "│",
			options = { try_as_border = true },
		},
		config = function(_, opts)
			vim.api.nvim_create_autocmd("FileType", {
				pattern = { "help", "alpha", "dashboard", "neo-tree", "Trouble", "lazy", "mason" },
				callback = function()
					vim.b.miniindentscope_disable = true
				end,
			})
			require("mini.indentscope").setup(opts)
		end,
	},
	{
		"goolord/alpha-nvim",
		module = "alpha",
		event = "BufWinEnter",
		config = function()
			require("narayan.alpha")
		end,
	},
	{
		-- tmux integration
		"christoomey/vim-tmux-navigator",
	},
	{
		-- autopairs
		"windwp/nvim-autopairs",
		dependencies = "hrsh7th/nvim-cmp",
		event = "VeryLazy",
		init = function()
			require("narayan.autopairs")
		end,
	},
	{
		-- autotag
		"windwp/nvim-ts-autotag",
		dependencies = "nvim-treesitter/nvim-treesitter",
		init = function()
			require("nvim-ts-autotag").setup()
		end,
	},
	{
		-- Comment
		"numToStr/Comment.nvim",
		event = "InsertEnter",
		init = function()
			require("narayan.comment")
		end,
	},
	{
		"JoosepAlviste/nvim-ts-context-commentstring",
		lazy = true,
	},
	{
		"akinsho/toggleterm.nvim",
		cmd = "Toggleterm",
		event = "BufWinEnter",
		init = function()
			require("narayan.toggleterm")
		end,
	},

	{ "ahmedkhalf/project.nvim", commit = "628de7e433dd503e782831fe150bb750e56e55d6" },
	{
		"lewis6991/impatient.nvim",
		init = function()
			require("narayan.impatient")
		end,
	},

	-- snippets
	{
		"L3MON4D3/LuaSnip",
		dependencies = {
			"rafamadriz/friendly-snippets",
		},
	},
	-- auto completion
	{
		"hrsh7th/nvim-cmp",
		version = false, -- last release is way too old
		event = "InsertEnter",
		dependencies = {
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-path",
			"saadparwaiz1/cmp_luasnip",
		},
		opts = function()
			require("narayan.cmp")
		end,
	},
}
