local M = {
	"nvim-treesitter/nvim-treesitter",
	commit = "8cd2b230174efbf7b5d9f49fe2f90bda6b5eb16e",
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
      "go",
      "markdown",
      "markdown_inline",
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
