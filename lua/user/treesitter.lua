local M = {
	"nvim-treesitter/nvim-treesitter",
	commit = "8cd2b230174efbf7b5d9f49fe2f90bda6b5eb16e",
	event = "BufReadPost",
	dependencies = {
		{
			"JoosepAlviste/nvim-ts-context-commentstring",
			event = "VeryLazy",
			commit = "1277b4a1f451b0f18c0790e1a7f12e1e5fdebfee",
		},
		{
			"nvim-tree/nvim-web-devicons",
			event = "VeryLazy",
			commit = "0568104bf8d0c3ab16395433fcc5c1638efc25d4",
		},
		{
			"HiPhish/rainbow-delimiters.nvim",
			event = "VeryLazy",
			commit = "f7a55274a74053ccfafc24005b6f46303d543288",
		},
	},
}
function M.config()
	local treesitter = require("nvim-treesitter")
	local configs = require("nvim-treesitter.configs")

	local parser_config = require("nvim-treesitter.parsers").get_parser_configs()
	require("ts_context_commentstring").setup({})

<<<<<<< HEAD
    highlight = {
      enable = true,             
      disable = {},  
    },
    autopairs = {
      enable = true,
    },
    indent = { enable = true, disable = {} },
=======
	parser_config.liquid = {
		install_info = {
			url = "https://github.com/Shopify/tree-sitter-liquid.git",
			files = { "src/parser.c" },
			branch = "main",
		},
		filetype = "liquid",
	}
>>>>>>> main

	configs.setup({
		ensure_installed = {
			"lua",
			"markdown",
			"markdown_inline",
			"bash",
			"latex",
			"liquid",
			"css",
			"html",
			"javascript",
      "fennel",
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

		context_commentstring = {
			enable = true,
			enable_autocmd = false,
		},
	})
end

return M
