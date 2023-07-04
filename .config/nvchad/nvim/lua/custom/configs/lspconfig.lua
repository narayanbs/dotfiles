local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities

local lspconfig = require "lspconfig"
local servers = { "pyright", "gopls" }

for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = on_attach,
    capabilities = capabilities,
  }
end

local clangd_capabilities = require("plugins.configs.lspconfig").capabilities
clangd_capabilities.offsetEncoding = "utf-8"
lspconfig.clangd.setup {
	on_attach = on_attach,
	capabilities = clangd_capabilities,
	cmd = {"clangd"},
	filetypes = { "c", "cpp"},
}
--
-- Without the loop, you would have to manually set up each LSP
-- lspconfig.gopls.setup {
-- 	on_attach = on_attach,
-- 	capabilities = capabilities,
-- 	cmd = {"gopls"},
-- 	filetypes = {"go", "gomod", "gowork", "gotmpl"},
-- }
--
-- lspconfig.pyright.setup {
-- 	on_attach = on_attach,
-- 	capabilities = capabilities,
-- }
--
-- lspconfig.html.setup {
--   on_attach = on_attach,
--   capabilities = capabilities,
-- }
--
-- lspconfig.cssls.setup {
--   on_attach = on_attach,
--   capabilities = capabilities,
-- }
