local M = {
	"tpope/vim-fugitive",
	commit = "41beedabc7e948c787ea5696e04c3544c3674e23",
	event = "VimEnter",
}

function M.config(plugin, opts)
	-- Fugitive
	KEYMAP("n", "<leader>gs", vim.cmd.Git, KEYMAP_OPTS)
end
return M
