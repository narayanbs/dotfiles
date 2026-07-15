----------------
-- =============================================================================
-- OPTIONS
-- =============================================================================
vim.g.mapleader = " "
vim.g.maplocalleader = " "

local opt = vim.opt
opt.termguicolors = true
opt.number = true
opt.relativenumber = false
opt.mouse = "a"
opt.ignorecase = true
opt.smartcase = true
opt.splitbelow = true
opt.splitright = true
opt.swapfile = false
opt.backup = false
opt.clipboard = "unnamedplus"
opt.undofile = true
opt.signcolumn = "yes"
opt.list = true
opt.listchars = { tab = "» ", trail = "·", nbsp = "␣" }
opt.inccommand = "nosplit"
opt.cursorline = true
opt.hlsearch = true
opt.breakindent = true
opt.tabstop = 2
opt.shiftwidth = 2
opt.expandtab = true
opt.confirm = true

----------------
-- Plugins
----------------------------------------------
vim.pack.add({

	-- colorscheme
	"https://github.com/shawilly/ponokai",
	"https://github.com/Aejkatappaja/sora",
	"https://github.com/AlexvZyl/nordic.nvim",
	"https://github.com/rmehri01/onenord.nvim",
	-- tree-sitter-manager
	"https://github.com/romus204/tree-sitter-manager.nvim",

	-- lsp
	"https://github.com/neovim/nvim-lspconfig",
	"https://github.com/mason-org/mason.nvim",
	"https://github.com/mason-org/mason-lspconfig.nvim",
	-- completion plugin
	{ src = "https://github.com/saghen/blink.cmp", version = vim.version.range("^1") },
	-- formatter
	"https://github.com/stevearc/conform.nvim",
	-- notifications
	"https://github.com/rcarriga/nvim-notify",
	"https://github.com/MunifTanjim/nui.nvim",
	"https://github.com/folke/noice.nvim",

	"https://github.com/nvim-lua/plenary.nvim", -- library dependency
	"https://github.com/nvim-tree/nvim-web-devicons", -- library dependency

	"https://github.com/nvim-neo-tree/neo-tree.nvim", -- explorer
	"https://github.com/nvim-lualine/lualine.nvim", -- status line
	"https://github.com/akinsho/bufferline.nvim", -- buffer line
	"https://github.com/folke/which-key.nvim", -- key explorer
	"https://github.com/nvim-telescope/telescope.nvim", -- the fuzzy finder
	"https://github.com/nvim-mini/mini.pairs", -- brackets autoclosing
})

-----------
--- Plugin Config
---------------------------------

-- colorscheme
vim.cmd("colorscheme onenord")

-- treesitter
require("tree-sitter-manager").setup({
	ensure_installed = {
		"rust",
		"c",
		"cpp",
		"go",
		"html",
		"css",
		"javascript",
		"json",
		"lua",
		"markdown",
		"python",
		"typescript",
		"bash",
		"lua",
		"python",
	},
	highlight = true,
})

-- tree explorer
require("neo-tree").setup({
	window = {
		width = 25,
	},
})

-- buffer line
require("bufferline").setup({
	options = {
		separator_style = "slant",
		diagnostics = "nvim_lsp",
		offsets = {
			{
				filetype = "neo-tree",
				text = "Explorer",
				highlight = "Directory",
				text_align = "left",
			},
		},
	},
})

-- lualine

require("lualine").setup({
	options = {
		theme = "auto",
	},
	extensions = {
		"neo-tree",
	},
})

-- blink completion engine

require("blink.cmp").setup({
	completion = {
		documentation = {
			auto_show = true,
		},
	},

	-- default blink keymaps
	keymap = {
		preset = "enter",
	},

	fuzzy = {
		implementation = "lua",
	},
})

local capabilities = {
	textDocument = {
		foldingRange = {
			dynamicRegistration = false,
			lineFoldingOnly = true,
		},
	},
}

capabilities = require("blink.cmp").get_lsp_capabilities(capabilities)

-- lsp server installation and configuration
vim.lsp.config("*", {
	capabilities = capabilities,
})

-- For line with problems, show message at the end of line
vim.diagnostic.config({ virtual_text = true })

vim.lsp.enable({
	"clangd",
	"gopls",
	"pyright",
	"lua_ls",
	"ts_ls",
	"emmet_language_server",
})

require("mason").setup({})
require("mason-lspconfig").setup({
	ensure_installed = { "lua_ls", "gopls", "pyright", "emmet_language_server", "ts_ls" },
})

require("noice").setup({
	lsp = {
		progress = { enabled = false },
		override = {
			["vim.lsp.util.convert_input_to_markdown_lines"] = true,
			["vim.lsp.util.stylize_markdown"] = true,
		},
	},
	presets = {
		bottom_search = true, -- use a classic bottom cmdline for search
		command_palette = true, -- position the cmdline and popupmenu together
		long_message_to_split = true, -- long messages will be sent to a split
		inc_rename = false, -- enables an input dialog for inc-rename.nvim
		lsp_doc_border = true, -- add a border to hover docs and signature help
	},
})

require("conform").setup({
	formatters_by_ft = {
		c = { "clang-format" },
		cpp = { "clang-format" },
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
	format_on_save = {
		lsp_format = "fallback",
		async = false,
		timeout_ms = 500,
	},
})

-- INFO: fuzzy finder
require("telescope").setup({})

-- Which-key: keybinding helper
require("which-key").setup({
	spec = {
		{ "<leader>s", group = "[S]earch", icon = { icon = "", color = "green" } },
	},
})

-- mini-pairs
require("mini.pairs").setup({})

-------------------------------------
-- keymaps
-------------------------------------
local opts = { noremap = true, silent = true }

vim.keymap.set({ "n", "v" }, "<Space>", "<Nop>", opts)

--- Quit Neovim
vim.keymap.set("n", "<leader>qq", ":qa<CR>", { desc = "Exit Neovim" })

-- clear search highlight using escape key
vim.keymap.set({ "i", "n" }, "<esc>", "<cmd>noh<cr><esc>", { desc = "Escape and Clear hlsearch" })

-- keep last yank when pasting
vim.keymap.set("v", "p", '"_dP', opts)

-- delete single character without copying into register
vim.keymap.set("n", "x", '"_x', opts)

-- tree explorer
vim.keymap.set("n", "<leader>e", ":Neotree toggle<CR>", { silent = true })

-- Navigate between splits
vim.keymap.set("n", "<C-k>", ":wincmd k<CR>", opts)
vim.keymap.set("n", "<C-j>", ":wincmd j<CR>", opts)
vim.keymap.set("n", "<C-h>", ":wincmd h<CR>", opts)
vim.keymap.set("n", "<C-l>", ":wincmd l<CR>", opts)

-- Buffer mappings - (Close others, Close current, previous tab, next tab)
vim.keymap.set("n", "<leader>bo", ":BufferLineCloseOthers<CR>", opts)
vim.keymap.set("n", "<leader>br", ":BufferLineCloseRight<CR>", opts)
vim.keymap.set("n", "<leader>bl", ":BufferLineCloseLeft<CR>", opts)
vim.keymap.set("n", "<leader>bd", ":<C-U>bprevious <bar> bdelete #<CR>", opts)
vim.keymap.set("n", "<S-h>", ":bprevious<CR>", opts)
vim.keymap.set("n", "<S-l>", ":bnext<CR>", opts)

-- indenting
vim.keymap.set("v", "<", "<gv", opts)
vim.keymap.set("v", ">", ">gv", opts)

-- diagnostics keymaps
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { desc = "goto previous diagnostic" })
vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { desc = "goto next diagnostic" })
vim.keymap.set("n", "<leader>d", vim.diagnostic.open_float, { desc = "open diagnostic" })
vim.keymap.set("n", "<leader>x", vim.diagnostic.setloclist, { desc = "show all diagnostics" })

--- completion
vim.keymap.set("i", "<c-space>", function()
	vim.lsp.completion.get()
end)

-- Telescope
local pickers = require("telescope.builtin")

vim.keymap.set("n", "<leader>fp", pickers.builtin, { desc = "[S]earch Builtin [P]ickers" })
vim.keymap.set("n", "<leader>fr", pickers.buffers, { desc = "[S]earch [B]uffers" })
vim.keymap.set("n", "<leader>ff", pickers.find_files, { desc = "[S]earch [F]iles" })
vim.keymap.set("n", "<leader>fw", pickers.grep_string, { desc = "[S]earch Current [W]ord" })
vim.keymap.set("n", "<leader>fg", pickers.live_grep, { desc = "[S]earch by [G]rep" })
vim.keymap.set("n", "<leader>sr", pickers.resume, { desc = "[S]earch [R]esume" })

vim.keymap.set("n", "<leader>fh", pickers.help_tags, { desc = "[S]earch [H]elp" })
vim.keymap.set("n", "<leader>fm", pickers.man_pages, { desc = "[S]earch [M]anuals" })

----------
-- Autocmds
---------------------------
-- format on save
vim.api.nvim_create_autocmd("BufWritePre", {
	pattern = "*.go",
	callback = function()
		local client = vim.lsp.get_clients({ buf = 0 })[1]
		if not client then
			return
		end

		local params = vim.lsp.util.make_range_params(0, client.offset_encoding)
		params.context = {
			only = { "source.organizeImports" },
		}

		vim.lsp.buf_request(0, "textDocument/codeAction", params, function(err, actions)
			if err then
				return
			end

			for _, action in pairs(actions or {}) do
				if action.edit then
					vim.lsp.util.apply_workspace_edit(action.edit, client.offset_encoding)
				end
			end
		end)
	end,
})

vim.api.nvim_create_autocmd("LspAttach", {
	desc = "LSP actions",
	callback = function(event)
		local opts = { buffer = event.buf }

		-- local client = vim.lsp.get_client_by_id(event.data.client_id)
		-- -- Disable semantic tokens
		-- client.server_capabilities.semanticTokensProvider = nil

		vim.keymap.set("n", "K", "<cmd>lua vim.lsp.buf.hover()<cr>", opts)
		vim.keymap.set("n", "gd", "<cmd>lua vim.lsp.buf.definition()<cr>", opts)
		vim.keymap.set("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<cr>", opts)
		vim.keymap.set("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<cr>", opts)
		vim.keymap.set("n", "go", "<cmd>lua vim.lsp.buf.type_definition()<cr>", opts)
		vim.keymap.set("n", "gr", "<cmd>lua vim.lsp.buf.references()<cr>", opts)
		vim.keymap.set("n", "gs", "<cmd>lua vim.lsp.buf.signature_help()<cr>", opts)
		vim.keymap.set("n", "rn", "<cmd>lua vim.lsp.buf.rename()<cr>", opts)
		vim.keymap.set({ "n", "x" }, "<F3>", "<cmd>lua vim.lsp.buf.format({async = true})<cr>", opts)
		vim.keymap.set("n", "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<cr>", opts)
	end,
})

-- uncomment to enable automatic plugin updates
-- vim.pack.update()
