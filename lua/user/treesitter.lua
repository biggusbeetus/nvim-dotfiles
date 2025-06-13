local M = {
	"nvim-treesitter/nvim-treesitter",
	commit = "f976acdc9c8214145a11372d2a7ae4a032f62a39",
	event = "VimEnter",
}
function M.config()
	local treesitter = require("nvim-treesitter")
    treesitter.setup()
    treesitter.install {
			"lua",
			"bash",
            "javascript",
            "typescript",
            "go",
            "markdown",
            "markdown_inline",
            "nix",
            "yaml"
        }
end

return M
