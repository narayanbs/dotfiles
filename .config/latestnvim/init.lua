require("config.options")
require("config.keymaps")
require("config.autocmds")
require("config.lazy")

vim.lsp.enable({
	"clangd",
	"go",
	"pyright",
	"lua",
})

vim.diagnostic.config({ virtual_text = true })

