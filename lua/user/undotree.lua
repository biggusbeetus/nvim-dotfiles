local M = {
	"mbbill/undotree",
	event = "VeryLazy",
	commit = "485f01efde4e22cb1ce547b9e8c9238f36566f21",
}

function M.config()
	local options = {
		undotree_SetFocusWhenToggle = true,
	}
	for k, v in pairs(options) do
		vim.g[k] = v
	end

	-- Undotree
	KEYMAP("n", "<leader>u", vim.cmd.UndotreeToggle, KEYMAP_OPTS)

end

return M
