local M = {
	"folke/trouble.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	event = "Bufenter",
	-- settings without a patched font or icons
	opts = {
	},
}

function M.config()
	require("trouble").setup({})
end

return M
