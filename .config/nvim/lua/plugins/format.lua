return {
	{
		"stevearc/conform.nvim",
		event = { "BufWritePre" },
		cmd = { "ConformInfo" },
		keys = {
			{
				"<a-d-l>",
				function()
					require("conform").format({
						lsp_fallback = true,
					})
				end,
				mode = "",
				desc = "Format buffer",
			},
		},
		opts = {
			formatters_by_ft = {
				python = {
					"ruff_fix",
					"ruff_format",
					"ruff_organize_imports",
				},
				swift = { "swift_format" },
				lua = { "stylua" },
				typescriptreact = { "prettierd", "prettier", "eslint_d", stop_after_first = false },
				html = { "prettierd", "prettier", stop_after_first = true },
				css = { "prettierd", "prettier", stop_after_first = true },
				php = { "pretty-php" },
				go = { "goimports", "gofmt", lsp_format = "fallback", stop_after_first = true },
				sql = { "sql_formatter " },
			},
		},
	},
}
