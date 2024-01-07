local M = {
	"nvim-telescope/telescope.nvim",
	commit = "87e92ea31b2b61d45ad044cf7b2d9b66dad2a618",
	event = "Bufenter",
	cmd = { "Telescope" },
	dependencies = {
		{
			"ahmedkhalf/project.nvim",
			commit = "8c6bad7d22eef1b71144b401c9f74ed01526a4fb",
		},
		{
			"nvim-telescope/telescope-file-browser.nvim",
			dependencies = {
				"nvim-lua/plenary.nvim",
			},
		},
	},
}

local actions = require("telescope.actions")

M.opts = {
	extensions = {
		file_browser = {
			theme = "ivy",
		},
	},
	defaults = {
		prompt_prefix = " ",
		selection_caret = " ",
		path_display = { "smart" },
		file_ignore_patterns = { ".git/", "node_modules" },
		initial_mode = "insert",
		mappings = {
			i = {
				["<Down>"] = actions.move_selection_next,
				["<Up>"] = actions.move_selection_previous,
				["<C-j>"] = actions.move_selection_next,
				["<C-k>"] = actions.move_selection_previous,
				["<C-b><C-d>"] = require("telescope.actions").delete_buffer,
			},
			n = {
				["<C-b><C-d>"] = require("telescope.actions").delete_buffer,
			},
		},
		vimgrep_arguments = {
			"rg",
			"-u",
			"--color=never",
			"--no-heading",
			"--with-filename",
			"--line-number",
			"--column",
			"--smart-case",
		},
	},
}

function M.config(_, opts)
	require("telescope").setup(opts)
	require("telescope").load_extension("file_browser")

	-- Telescope
	KEYMAP("n", "<leader>ff", function()
		require("telescope.builtin").find_files({ hidden = true })
	end, KEYMAP_OPTS)
	KEYMAP("n", "<leader>fo", function()
		require("telescope.builtin").oldfiles()
	end, KEYMAP_OPTS)
	KEYMAP("n", "<leader>ft", function()
		require("telescope.builtin").live_grep({ additional_args = "-u" })
	end, KEYMAP_OPTS)
	KEYMAP("n", "<leader>fg", function()
		require("telescope.builtin").git_files()
	end, KEYMAP_OPTS)
	KEYMAP("n", "<leader>ls", function()
		require("telescope.builtin").buffers()
	end, KEYMAP_OPTS)
	KEYMAP("n", "<leader>bf", function()
		require("telescope").extensions.file_browser.file_browser()
	end, KEYMAP_OPTS)
	KEYMAP("n", "<leader>fp", ":Telescope projects<CR>", KEYMAP_OPTS)
end

return M
