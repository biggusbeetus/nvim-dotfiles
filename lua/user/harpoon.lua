local M = {
	"ThePrimeagen/harpoon",
	commit = "c1aebbad9e3d13f20bedb8f2ce8b3a94e39e424a",
	event = "BufEnter",
	lazy = true,
	dependencies = {
		{
			"nvim-lua/plenary.nvim",
			commit = "9a0d3bf7b832818c042aaf30f692b081ddd58bd9",
			lazy = true,
		},
	},
}

function M.config(plugin, opts)

	require(plugin.name).setup(opts)

	-- Harpoon keymaps
	local mark = require("harpoon.mark")
	local ui = require("harpoon.ui")

	KEYMAP("n", "<leader>a", mark.add_file, KEYMAP_OPTS)
	KEYMAP("n", "<C-e>", ui.toggle_quick_menu, KEYMAP_OPTS)
	KEYMAP("n", "<leader>1", function()
		ui.nav_file(1)
	end, KEYMAP_OPTS)
	KEYMAP("n", "<leader>2", function()
		ui.nav_file(2)
	end, KEYMAP_OPTS)
	KEYMAP("n", "<leader>3", function()
		ui.nav_file(3)
	end, KEYMAP_OPTS)
	KEYMAP("n", "<leader>4", function()
		ui.nav_file(4)
	end, KEYMAP_OPTS)
end
return M
