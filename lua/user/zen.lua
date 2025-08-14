local M = {
	"folke/zen-mode.nvim",
}

function M.config()
	KEYMAP("n", "<leader>zz", function()
		require("zen-mode").toggle({})
	end)
end

return M
