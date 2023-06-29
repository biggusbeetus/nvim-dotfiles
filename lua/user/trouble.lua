local M = {
	"folke/trouble.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
  event = "Bufenter",
	config = {
		severity = nil,
		use_diagnostic_signs = true,
	},
}

function M.config()
	require("trouble").setup({})
end

return M
