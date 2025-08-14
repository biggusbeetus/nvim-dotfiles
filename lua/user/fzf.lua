M = {
	"ibhagwan/fzf-lua",
	commit = "a768d39d44a7e69c04ee980efa8e0925a19b3c2b",
	event = "VimEnter",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	opts = {
		fzf_colors = {
			true, -- auto generate rest of fzf’s highlights?
			["bg"] = "-1",
			["gutter"] = "-1", -- I like this one too, try with and without
		},
	},
}

function M.config(plugin, opts)
	local fzf = require("fzf-lua")
	require(plugin.name).setup(opts)
	KEYMAP("n", "<leader>gf", function()
		fzf.files()
	end, KEYMAP_OPTS)
	KEYMAP("n", "<leader>gb", function()
		fzf.grep_curbuf()
	end, KEYMAP_OPTS)
	KEYMAP("n", "<leader>gg", function()
		fzf.live_grep()
	end, KEYMAP_OPTS)
	KEYMAP("n", "<leader>gx", function()
		fzf.quickfix()
	end, KEYMAP_OPTS)
	KEYMAP("n", "<leader>ls", function()
		fzf.buffers()
	end, KEYMAP_OPTS)
	KEYMAP("n", "<leader>go", function()
		fzf.oldfiles()
	end, KEYMAP_OPTS)
end

return M
