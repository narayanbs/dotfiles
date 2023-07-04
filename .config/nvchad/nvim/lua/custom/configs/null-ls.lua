local null_ls = require "null-ls"
local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics

local sources = {
  formatting.clang_format,
  formatting.stylua,
  formatting.black.with { extra_args = { "--fast" } },
  formatting.isort,
  formatting.stylua,
  formatting.gofmt,
  diagnostics.flake8,
}

null_ls.setup {
  sources = sources,
  -- you can reuse a shared lspconfig on_attach callback here
  on_attach = function(client, bufnr)
    if client.supports_method "textDocument/formatting" then
      vim.api.nvim_clear_autocmds { group = augroup, buffer = bufnr }
      vim.api.nvim_create_autocmd("BufWritePre", {
        group = augroup,
        buffer = bufnr,
        callback = function()
          vim.lsp.buf.code_action { context = { only = { "source.organizeImports" } }, apply = true }
          vim.lsp.buf.format { async = false }
        end,
      })
    end
  end,
}
