M = {
	"nvimdev/dashboard-nvim",
	event = "VimEnter",
	config = function()
		require("dashboard").setup({
			theme = "doom",
			config = {
				header = {
					[[                                                                       ]],
					[[                                                                     ]],
					[[       ████ ██████           █████      ██                     ]],
					[[      ███████████             █████                             ]],
					[[      █████████ ███████████████████ ███   ███████████   ]],
					[[     █████████  ███    █████████████ █████ ██████████████   ]],
					[[    █████████ ██████████ █████████ █████ █████ ████ █████   ]],
					[[  ███████████ ███    ███ █████████ █████ █████ ████ █████  ]],
					[[ ██████  █████████████████████ ████ █████ █████ ████ ██████ ]],
					[[                                                                       ]],
				}, --your header
				center = {
					{
						icon = "󰮗 ",
						icon_hl = "Title",
						desc = "findfiles",
						key = "f",
						keymap = "<leader>ff",
						action = "Telescope find_files",
					},
					{
						icon = "󱎸 ",
						icon_hl = "Title",
						desc = "livegrep",
						key = "g",
						keymap = "<leader>ft",
						action = "Telescope live_grep",
					},
					{
						icon = "󱀼 ",
						icon_hl = "Title",
						desc = "oldfiles",
						key = "o",
						keymap = "<leader>fo",
						action = "Telescope oldfiles",
					},
					{
						icon = "󱏒 ",
						icon_hl = "Title",
						desc = "filebrowser",
						key = "b",
						keymap = "<leader>fb",
						action = "Telescope file_browser",
					},
				},
				footer = {}, --your footer
			},
		})
	end,
	dependencies = { { "nvim-tree/nvim-web-devicons" } },
}

return M
