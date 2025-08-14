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
		"rafamadriz/friendly-snippets",
		"saadparwaiz1/cmp_luasnip",
		"j-hui/fidget.nvim",
		"creativenull/efmls-configs-nvim",
	},

	config = function()
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

		local conform = require("conform")
		local formatters = { "prettier", "stylua" }
		for _, pkg in ipairs(formatters) do
			-- Needs to load after mason.setup, else no packages are
			-- registered
			if not require("mason-registry").is_installed(pkg) then
				require("mason.api.command").MasonInstall({ pkg })
			end
		end
		conform.setup({
			lsp_format = "fallback",
			formatters_by_ft = {
				lua = { "stylua", lsp_format = "fallback" },
				go = { "gofmt", lsp_format = "fallback" },
				bash = { "shfmt" },
				sh = { "shfmt" },
				javascript = { "prettier" },
				typescript = { "prettier" },
				css = { "prettier" },
				scss = { "prettier" },
				yaml = { "prettier" },
				liquid = { lsp_format = "prefer" },
			},
		})
		KEYMAP("n", "<leader>f", function()
			conform.format({ bufnr = 0 })
		end)

		local servers = {
			"lua_ls",
			"gopls",
			"efm",
			"html",
			"ts_ls",
			"cssls",
		}

		require("mason-lspconfig").setup({
			ensure_installed = servers,
		})

		local handlers = {
			function(server_name) -- default handler (optional)
				vim.lsp.config(server_name, {
					capabilities = capabilities,
					root_markers = { ".git" },
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
					filetypes = { "sh", "bash" },
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

		require("luasnip.loaders.from_vscode").lazy_load()
		local cmp_select = { behavior = cmp.SelectBehavior.Select }

		cmp.setup({
            window = {
                completion = cmp.config.window.bordered("double"),

            },
			snippet = {
				expand = function(args)
					require("luasnip").lsp_expand(args.body) -- For `luasnip` users.
				end,
			},
			mapping = cmp.mapping.preset.insert({
				["<C-b>"] = cmp.mapping.scroll_docs(-6),
				["<C-f>"] = cmp.mapping.scroll_docs(6),
				["<C-k>"] = cmp.mapping.select_prev_item(cmp_select),
				["<C-j>"] = cmp.mapping.select_next_item(cmp_select),
				["<C-y>"] = cmp.mapping.confirm({ select = true }),
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
			virtual_text = { current_line = true },
			float = {
				focusable = false,
				border = "double",
				source = "always",
				header = "",
				prefix = "",
			},
		})
	end,
}
