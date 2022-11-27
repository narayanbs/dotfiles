local servers = {
	"gopls",
	"cssls",
	"tsserver",
	"emmet_ls",
	"pyright",
	"jsonls",
}

local settings = {
	ui = {
		border = "none",
		icons = {
			package_installed = "◍",
			package_pending = "◍",
			package_uninstalled = "◍",
		},
	},
	log_level = vim.log.levels.INFO,
	max_concurrent_installers = 4,
}

require("mason").setup(settings)
require("mason-lspconfig").setup({
	ensure_installed = servers,
	automatic_installation = { exclude = { "clangd" } },
})

local lspconfig_status_ok, lspconfig = pcall(require, "lspconfig")
if not lspconfig_status_ok then
	return
end

for _, server in pairs(servers) do
	local opts = {
		on_attach = require("narayan.lsp.handlers").on_attach,
		capabilities = require("narayan.lsp.handlers").capabilities,
	}
	server = vim.split(server, "@")[1]

	local require_ok, conf_opts = pcall(require, "narayan.lsp.settings." .. server)
	if require_ok then
		opts = vim.tbl_deep_extend("force", conf_opts, opts)
	end

	lspconfig[server].setup(opts)
end

-- required for clangd
local clangd_onattach = require("narayan.lsp.handlers").on_attach
local clangd_capabilities = require("narayan.lsp.handlers").capabilities
clangd_capabilities.offsetEncoding = "utf-8"
lspconfig["clangd"].setup({
	on_attach = clangd_onattach,
	capabilities = clangd_capabilities,
})
