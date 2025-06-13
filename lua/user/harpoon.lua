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
	KEYMAP("n", "<leader>h", ui.toggle_quick_menu, KEYMAP_OPTS)

	for i = 1, 9, 1 do
		KEYMAP("n", "<leader>" .. tostring(i), function()
			ui.nav_file(i)
		end, KEYMAP_OPTS)
	end
end
return M
