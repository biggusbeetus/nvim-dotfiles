local M = {
	"stevearc/conform.nvim",
	opts = {},
	config = function()
		local conform = require("conform")
		conform.setup({
			formatters_by_ft = {
				lua = { "stylua", lsp_format = "fallback"},
				go = { "gofmt", lsp_format = "fallback" },
                bash = {"shfmt"},
                sh = {"shfmt"},
			},
		})

		KEYMAP("n", "<leader>f", function()
			conform.format({ bufnr = 0 })
		end)
	end,
}
return M
