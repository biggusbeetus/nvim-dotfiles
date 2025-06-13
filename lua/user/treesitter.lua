local M = {
	"nvim-treesitter/nvim-treesitter",
	commit = "f976acdc9c8214145a11372d2a7ae4a032f62a39",
	event = "VimEnter",
	opts = {
		parser_install_dir = "~/.treesitter"
	}
}
function M.config(_, opts)
	local treesitter = require("nvim-treesitter")
    treesitter.setup(opts)
    treesitter.install {
	"lua",
	"bash",
        }
end

return M
