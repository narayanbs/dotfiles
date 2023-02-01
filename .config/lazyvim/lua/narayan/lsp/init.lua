local status_ok, _ = pcall(require, "lspconfig")
if not status_ok then
	return
end

require("narayan.lsp.mason")
require("narayan.lsp.handlers").setup()
require("narayan.lsp.null-ls")
