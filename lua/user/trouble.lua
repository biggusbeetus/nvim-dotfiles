local M = {
	"folke/trouble.nvim",
}

function M.config(_, opts)
  local trouble = require "trouble"
	trouble.setup({
		icons = false,
	})

	trouble.setup(opts)
	KEYMAP("n", "<leader>tt", function()
		trouble.toggle("diagnostics")
	end, KEYMAP_OPTS)
	KEYMAP("n", "<leader>[t", function()
		trouble.next({ skip_groups = true, jump = true })
	end, KEYMAP_OPTS)
	KEYMAP("n", "<leader>]t", function()
		trouble.previous({ skip_groups = true, jump = true })
	end, KEYMAP_OPTS)
end

return M
