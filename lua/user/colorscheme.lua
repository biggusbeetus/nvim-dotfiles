local M = {
	"rose-pine/neovim",
	name = "rose-pine",
}

function M.config()
	require("rose-pine").setup({
		variant = "auto", -- auto, main, moon, or dawn
		disable_background = true,
		styles = {
			italic = false,
		},
	})
	vim.cmd.colorscheme("rose-pine")
end

return M
