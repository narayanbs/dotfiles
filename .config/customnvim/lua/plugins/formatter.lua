return {
	"stevearc/conform.nvim",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		local conform = require("conform")

		conform.setup({
			formatters_by_ft = {
				c = { "clang-format" },
				cpp = { "clang-format" },
				lua = { "stylua" },
				python = { "isort", "black" },
				go = { "goimports", "gofmt" },
				javascript = { "prettier" },
				typescript = { "prettier" },
				javascriptreact = { "prettier" },
				typescriptreact = { "prettier" },
				css = { "prettier" },
				html = { "prettier" },
				json = { "prettier" },
				yaml = { "prettier" },
				markdown = { "prettier" },
				graphql = { "prettier" },
			},
			format_on_save = {
				lsp_fallback = true,
				async = false,
				timeout_ms = 500,
			},
		})
		vim.keymap.set({ "n", "v" }, "<leader>cf", function()
			conform.format({
				lsp_fallback = true,
				async = false,
				timeout_ms = 500,
			})
		end, { desc = "Format file or range (in visual mode)" })
	end,
}

-- return { -- Autoformat
-- 	"stevearc/conform.nvim",
-- 	event = { "BufWritePre" },
-- 	cmd = { "ConformInfo" },
-- 	keys = {
-- 		{
-- 			"<leader>f",
-- 			function()
-- 				require("conform").format({ async = true, lsp_format = "fallback" })
-- 			end,
-- 			mode = "",
-- 			desc = "[F]ormat buffer",
-- 		},
-- 	},
-- 	opts = {
-- 		notify_on_error = false,
-- 		format_on_save = true,
-- 		formatters_by_ft = {
-- 			c = { "clang-format" },
-- 			cpp = { "clang-format" },
-- 			lua = { "stylua" },
-- 			python = { "isort", "black" },
-- 			go = { "goimports", "gofmt" },
-- 			javascript = { "prettier" },
-- 			typescript = { "prettier" },
-- 			javascriptreact = { "prettier" },
-- 			typescriptreact = { "prettier" },
-- 			css = { "prettier" },
-- 			html = { "prettier" },
-- 			json = { "prettier" },
-- 			yaml = { "prettier" },
-- 			markdown = { "prettier" },
-- 			graphql = { "prettier" },
-- 		},
-- 	},
-- }
