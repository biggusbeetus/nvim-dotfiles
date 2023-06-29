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
		vim.wo.wrap = false
		vim.wo.number = true
		vim.wo.rnu = false
	end)

	KEYMAP("n", "<leader>zZ", function()
		require("zen-mode").setup({
			window = {
				width = 80,
				options = {},
			},
		})
		require("zen-mode").toggle()
		vim.wo.wrap = false
		vim.wo.number = false
		vim.wo.rnu = false
		-- vim.opt.colorcolumn = "0"
	end)
end

return M
