local M = {
	"folke/trouble.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	lazy = false,
	config = {
		severity = nil,
		use_diagnostic_signs = true,
	},
}

function M.config()
	require("trouble").setup({})
end

return M
