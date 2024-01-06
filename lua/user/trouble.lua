local M = {
	"folke/trouble.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	event = "Bufenter",
	config = {
		severity = nil,
		use_diagnostic_signs = true,
	},
}

function M.config(plugin, options)

  plugin.setup(options)

	KEYMAP("n", "<leader>xx", "<cmd>TroubleToggle<cr>", KEYMAP_OPTS)
	KEYMAP("n", "<leader>xw", "<cmd>TroubleToggle workspace_diagnostics<cr>", KEYMAP_OPTS)
	KEYMAP("n", "<leader>xd", "<cmd>TroubleToggle document_diagnostics<cr>", KEYMAP_OPTS)
	KEYMAP("n", "<leader>xl", "<cmd>TroubleToggle loclist<cr>", KEYMAP_OPTS)
	KEYMAP("n", "<leader>xq", "<cmd>TroubleToggle quickfix<cr>", KEYMAP_OPTS)
	KEYMAP("n", "gR", "<cmd>TroubleToggle lsp_references<cr>", KEYMAP_OPTS)

end

-- return M
