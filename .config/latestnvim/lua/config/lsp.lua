
local capabilities = {
	textDocument = {
		foldingRange = {
			dynamicRegistration = false,
			lineFoldingOnly = true,
		},
	},
}

capabilities = require("blink.cmp").get_lsp_capabilities(capabilities)

-- Setup language servers.

vim.lsp.config("*", {
	capabilities = capabilities,
	root_markers = { ".git" },
})

vim.lsp.enable({
	"clangd",
	"go",
	"pyright",
	"lua",
	"ts_ls",
})

vim.diagnostic.config({ virtual_text = true })

