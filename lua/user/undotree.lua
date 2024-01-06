local M = {
	"mbbill/undotree",
	event = "Bufenter",
	commit = "485f01efde4e22cb1ce547b9e8c9238f36566f21",
}

function M.config()
	local options = {
		undotree_SetFocusWhenToggle = true,
		undodir = os.getenv("HOME") .. "/.vim/undodir",
		undofile = true,
	}
	for k, v in pairs(options) do
		vim.g[k] = v
	end
end

return M
