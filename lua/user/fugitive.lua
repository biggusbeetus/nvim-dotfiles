local M = {
	"tpope/vim-fugitive",
	commit = "43f18ab9155c853a84ded560c6104e6300ad41da",
	event = "VimEnter",
}

function M.config(plugin, opts)
	-- Fugitive
	KEYMAP("n", "<leader>gs", vim.cmd.Git, KEYMAP_OPTS)
end
return M
