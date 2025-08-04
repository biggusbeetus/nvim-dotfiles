local dir = os.getenv("HOME") .. "/.treesitter"
local treesitter_langs = {
	"lua",
	"bash",
	"go",
	"python",
    "liquid",
    "html",
}
local M = {
	"nvim-treesitter/nvim-treesitter",
	lazy = false,
	opts = {
		parser_install_dir = dir,
		ensure_installed = treesitter_langs,
		highlight = {
			enable = true,
			additional_vim_regex_highlighting = false,
		},
		incremental_selection = {
			enable = true,
			keymaps = {
				init_selection = "gnn", -- set to `false` to disable one of the mappings
				node_incremental = "grn",
				scope_incremental = "grc",
				node_decremental = "grm",
			},
		},
		indent = {
			enable = true,
		},
	},
}

function M.config(_, opts)
    vim.opt.runtimepath:prepend(dir)
	local treesitter = require("nvim-treesitter.configs")
	treesitter.setup(opts)
    vim.treesitter.language.register('html', 'liquid')
end

return M
