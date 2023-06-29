local M = {
	"folke/zen-mode.nvim",
	event = "VeryLazy",
	commit = "68f554702de63f4b7b6b6d4bcb10178f41a0acc7",
}

function M.config()
	KEYMAP("n", "<leader>zz", function()
		require("zen-mode").setup({
			window = {
				width = 90,
				options = {},
			},
		})
		require("zen-mode").toggle()
		vim.wo.wrap = true
	end)
end

return M
