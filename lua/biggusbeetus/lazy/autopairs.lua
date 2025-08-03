local M = {
	"windwp/nvim-autopairs",
	event = "BufReadPre",
	config = true,
	dependencies = {
		{
			"windwp/nvim-ts-autotag",
			event = "BufReadPre",
		},
	},
}

function M.config()
	local npairs = require("nvim-autopairs")
	local ntags = require("nvim-ts-autotag")
	npairs.setup({
		check_ts = true,
	})
	ntags.setup({
		opts = {
			-- Defaults
			enable_close = true, -- Auto close tags
			enable_rename = true, -- Auto rename pairs of tags
			enable_close_on_slash = true, -- Auto close on trailing </
		},
	})

end
return M
