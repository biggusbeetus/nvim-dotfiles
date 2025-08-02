local root_files = {
	".git",
}

return {
	"neovim/nvim-lspconfig",
	event = {
		"BufEnter",
	},
	dependencies = {
		"stevearc/conform.nvim",
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",
		"hrsh7th/cmp-nvim-lsp",
		"hrsh7th/cmp-buffer",
		"hrsh7th/cmp-path",
		"hrsh7th/cmp-cmdline",
		"hrsh7th/nvim-cmp",
		"L3MON4D3/LuaSnip",
		"saadparwaiz1/cmp_luasnip",
		"j-hui/fidget.nvim",
		"creativenull/efmls-configs-nvim",
	},

	config = function()
		require("conform").setup({
			formatters_by_ft = {},
		})
		local cmp = require("cmp")
		local cmp_lsp = require("cmp_nvim_lsp")
		local capabilities = vim.tbl_deep_extend(
			"force",
			{},
			vim.lsp.protocol.make_client_capabilities(),
			cmp_lsp.default_capabilities()
		)

		require("fidget").setup({})
		require("mason").setup({
			install_root_dir = os.getenv("HOME") .. "/.mason",
		})

		local servers = {
			"lua_ls",
			"gopls",
			"efm",
			"html",
			"shopify_theme_ls",
		}

		require("mason-lspconfig").setup({
			ensure_installed = servers,
		})

		local handlers = {
			function(server_name) -- default handler (optional)
				vim.lsp.config(server_name, {
					capabilities = capabilities,
                    root_markers = root_files,
				})
			end,
			["lua_ls"] = function()
				vim.lsp.config("lua_ls", {
					capabilities = capabilities,
					settings = {
						Lua = {
							format = {
								enable = true,
								-- Put format options here
								-- NOTE: the value should be STRING!!
								defaultConfig = {
									indent_style = "space",
									indent_size = "2",
								},
							},
						},
					},
				})
			end,
			["html"] = function()
				vim.lsp.config("html", {
					capabilities = capabilities,
					filetypes = { "html", "templ", "liquid" },
                    root_markers = root_files,
				})
			end,
			["efm"] = function()
				vim.lsp.config("efm", {
					capabilities = capabilities,
					init_options = { documentFormatting = true },
					settings = {
						rootMarkers = { ".git/" },
						languages = {
							sh = {
								require("efmls-configs.linters.shellcheck"),
								require("efmls-configs.formatters.shfmt"),
							},
						},
					},
				})
			end,
		}

		for _, server in ipairs(servers) do
			if handlers[server] ~= nil then
				handlers[server]()
			else
				handlers[1](server)
			end
		end

		local cmp_select = { behavior = cmp.SelectBehavior.Select }

		cmp.setup({
			snippet = {
				expand = function(args)
					require("luasnip").lsp_expand(args.body) -- For `luasnip` users.
				end,
			},
			mapping = cmp.mapping.preset.insert({
				["<C-k>"] = cmp.mapping.select_prev_item(cmp_select),
				["<C-j>"] = cmp.mapping.select_next_item(cmp_select),
				["<CR>"] = cmp.mapping.confirm({ select = true }),
				["<C-Space>"] = cmp.mapping.complete(),
			}),
			sources = cmp.config.sources({
				{ name = "nvim_lsp" },
				{ name = "luasnip" }, -- For luasnip users.
			}, {
				{ name = "buffer" },
			}),
		})

		vim.diagnostic.config({
			-- update_in_insert = true,
			float = {
				focusable = false,
				style = "minimal",
				border = "rounded",
				source = "always",
				header = "",
				prefix = "",
			},
		})
	end,
}
