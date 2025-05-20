local M = {
	"nvim-treesitter/nvim-treesitter",
	commit = "066fd6505377e3fd4aa219e61ce94c2b8bdb0b79",
	event = "VimEnter",
	dependencies = {
	{
			"HiPhish/rainbow-delimiters.nvim",
	    event = "BufReadPost",
			commit = "f7a55274a74053ccfafc24005b6f46303d543288",
		},
	},
}
function M.config()
	local treesitter = require("nvim-treesitter")
	local configs = require("nvim-treesitter.configs")

	local parser_config = require("nvim-treesitter.parsers").get_parser_configs()

	configs.setup({
		ensure_installed = {
			"lua",
			"bash",
            "javascript",
            "typescript",
            "go",
            "markdown",
            "markdown_inline",
            "nix",
            "yaml",
		},
		ignore_install = { "" },
		sync_install = false,

		highlight = {
			enable = true, -- false will disable the whole extension
			disable = {}, -- list of language that will be disabled
		},
		autopairs = {
			enable = true,
		},
		indent = { enable = true, disable = {} },
	})
end

return M
