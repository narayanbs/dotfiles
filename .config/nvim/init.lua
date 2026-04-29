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

-- =============================================================================
-- PLUGINS
-- =============================================================================
vim.pack.add({
	-- colorscheme
	"https://github.com/shawilly/ponokai",
	"https://github.com/Aejkatappaja/sora",
	"https://github.com/AlexvZyl/nordic.nvim",
	-- treesitter
	{ src = "https://github.com/nvim-treesitter/nvim-treesitter", build = ":TSUpdate" },
	-- lsp
	"https://github.com/neovim/nvim-lspconfig",
	"https://github.com/mason-org/mason.nvim",
	"https://github.com/mason-org/mason-lspconfig.nvim",
	-- blink
	{ src = "https://github.com/saghen/blink.cmp", version = vim.version.range("^1") },
	-- formatter
	"https://github.com/stevearc/conform.nvim",
	-- notifications
	"https://github.com/rcarriga/nvim-notify",
	"https://github.com/MunifTanjim/nui.nvim",
	"https://github.com/folke/noice.nvim",
	"https://github.com/nvim-lua/plenary.nvim",
	"https://github.com/nvim-tree/nvim-web-devicons",
	-- explorer
	"https://github.com/nvim-neo-tree/neo-tree.nvim",
	-- status line
	"https://github.com/nvim-lualine/lualine.nvim",
	-- buffer line
	"https://github.com/akinsho/bufferline.nvim",
	-- keymap list
	"https://github.com/folke/which-key.nvim",
	-- fuzzy finder
	"https://github.com/nvim-telescope/telescope.nvim",
})

-- =============================================================================
-- SAFE HELPERS
-- =============================================================================

local function safe_require(module, setup_fn)
	local ok, plugin = pcall(require, module)
	if not ok then
		vim.notify("Failed to load module: " .. module, vim.log.levels.WARN)
		return
	end
	setup_fn(plugin)
end

local function safe_cmd(cmd, msg)
	local ok = pcall(vim.cmd, cmd)
	if not ok then
		vim.notify(msg or ("Failed to run: " .. cmd), vim.log.levels.WARN)
	end
end

-- =============================================================================
-- COLORSCHEME
-- =============================================================================

safe_cmd("colorscheme nordic", "Colorscheme 'nordic' not found")

-- =============================================================================
-- PLUGIN CONFIGS
-- =============================================================================

safe_require("nvim-treesitter.configs", function(ts)
	ts.setup({
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
		},
		highlight = { enable = true },
	})
end)

safe_require("neo-tree", function(nt)
	nt.setup({
		window = { width = 25 },
		-- enable_git_status = true,
		-- enable_diagnostics = true,
		--
		-- default_component_configs = {
		-- 	icon = {
		-- 		enabled = true,
		-- 	},
		-- },
	})
end)

safe_require("bufferline", function(bl)
	bl.setup({
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
end)

safe_require("lualine", function(ll)
	ll.setup({
		options = { globalstatus = true },
		extensions = { "neo-tree" },
	})
end)

safe_require("blink.cmp", function(cmp)
	cmp.setup({
		completion = { documentation = { auto_show = true } },
		keymap = { preset = "enter" },
		fuzzy = { implementation = "lua" },
	})

	-- LSP capabilities (cleaned: no double require)
	vim.lsp.config("*", {
		capabilities = cmp.get_lsp_capabilities(),
	})
end)

safe_require("mason", function(m)
	m.setup({})
end)

safe_require("mason-lspconfig", function(ml)
	ml.setup({
		ensure_installed = {
			"lua_ls",
			"gopls",
			"pyright",
			"emmet_language_server",
			"ts_ls",
		},
	})
end)

safe_require("noice", function(n)
	n.setup({
		lsp = { progress = { enabled = false } },
		presets = {
			bottom_search = true,
			command_palette = true,
			lsp_doc_border = true,
		},
	})
end)

safe_require("conform", function(c)
	c.setup({
		formatters_by_ft = {
			lua = { "stylua" },
			python = { "isort", "black" },
			go = { "goimports", "gofmt" },
			javascript = { "prettierd" },
			typescript = { "prettierd" },
		},
		format_on_save = {
			lsp_format = "fallback",
			timeout_ms = 500,
		},
	})
end)

safe_require("telescope", function(t)
	t.setup({})
end)

safe_require("which-key", function(wk)
	wk.setup({
		spec = {
			{
				"<leader>s",
				group = "[S]earch",
				icon = { icon = "", color = "green" },
			},
		},
	})
end)

-- =============================================================================
-- LSP ENABLE (native Neovim 0.11+ style)
-- =============================================================================

vim.lsp.enable({
	"clangd",
	"gopls",
	"pyright",
	"lua_ls",
	"ts_ls",
	"emmet_language_server",
})

-- =============================================================================
-- KEYMAPS
-- =============================================================================

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
		local params = vim.lsp.util.make_range_params()
		params.context = { only = { "source.organizeImports" } }
		-- buf_request_sync defaults to a 1000ms timeout. Depending on your
		-- machine and codebase, you may want longer. Add an additional
		-- argument after params if you find that you have to write the file
		-- twice for changes to be saved.
		-- E.g., vim.lsp.buf_request_sync(0, "textDocument/codeAction", params, 3000)
		local result = vim.lsp.buf_request_sync(0, "textDocument/codeAction", params)
		for cid, res in pairs(result or {}) do
			for _, r in pairs(res.result or {}) do
				if r.edit then
					local enc = (vim.lsp.get_client_by_id(cid) or {}).offset_encoding or "utf-16"
					vim.lsp.util.apply_workspace_edit(r.edit, enc)
				end
			end
		end
		vim.lsp.buf.format({ async = false })
	end,
})

vim.api.nvim_create_autocmd("LspAttach", {
	desc = "LSP actions",
	callback = function(event)
		local opts = { buffer = event.buf }

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
