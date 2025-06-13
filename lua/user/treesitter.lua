local M = {
	"nvim-treesitter/nvim-treesitter",
	commit = "066fd6505377e3fd4aa219e61ce94c2b8bdb0b79",
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
