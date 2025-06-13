local M = {
	"neovim/nvim-lspconfig",
	commit = "36255be0c6891315e8cb66d270a1e38269d4e8da",
	lazy = false,
	event = { "BufReadPre" },
	dependencies = {
		{
			"hrsh7th/nvim-cmp",
			commit = "b5311ab3ed9c846b585c0c15b7559be131ec4be9",
			event = {
				"InsertEnter",
				"CmdlineEnter",
			},
			dependencies = {
				{
					"hrsh7th/cmp-buffer",
					commit = "b74fab3656eea9de20a9b8116afa3cfc4ec09657",
				},
				{
					"hrsh7th/cmp-path",
					commit = "c6635aae33a50d6010bf1aa756ac2398a2d54c32",
				},
				{
					"hrsh7th/cmp-cmdline",
					commit = "d126061b624e0af6c3a556428712dd4d4194ec6d",
				},
				{
					"saadparwaiz1/cmp_luasnip",
					commit = "98d9cb5c2c38532bd9bdb481067b20fea8f32e90",
				},
				{
					"L3MON4D3/LuaSnip",
					version = "v2.4",
					build = "make install_jsregexp",
					-- event = "InsertEnter",
					dependencies = {
						{
							"honza/vim-snippets",
							commit = "f0a3184d9f90b96b044d5914625a25c554d7f301",
						},
						{
							"rafamadriz/friendly-snippets",
							commit = "572f5660cf05f8cd8834e096d7b4c921ba18e175",
						},
					},
				},
			},
		},
		{
			"hrsh7th/cmp-nvim-lsp",
			commit = "a8912b88ce488f411177fc8aed358b04dc246d7b",
		},
	},
}

function M.config()
	local lspconfig = require("lspconfig")
	local cmp_nvim_lsp = require("cmp_nvim_lsp")

	local capabilities = vim.lsp.protocol.make_client_capabilities()
	capabilities.textDocument.completion.completionItem.snippetSupport = true
	capabilities = cmp_nvim_lsp.default_capabilities(M.capabilities)

	local sign_icons = {
		{ name = "DiagnosticSignError", text = "E" },
		{ name = "DiagnosticSignWarn", text = "W" },
		{ name = "DiagnosticSignHint", text = "H" },
		{ name = "DiagnosticSignInfo", text = "I" },
	}

	local function lsp_keymaps(client, bufnr)
		local opts = { buffer = bufnr, remap = false }

		KEYMAP("n", "<leader>ld", function()
			vim.lsp.buf.definition()
		end, opts)
		KEYMAP("n", "K", function()
			vim.lsp.buf.hover()
		end, opts)
		KEYMAP("n", "<leader>lw", function()
			vim.lsp.buf.workspace_symbol()
		end, opts)
		KEYMAP("n", "<leader>le", function()
			vim.diagnostic.open_float({ source = "if_many", virtual_text = true })
		end, opts)
		KEYMAP("n", "[d", function()
			vim.diagnostic.goto_next()
		end, opts)
		KEYMAP("n", "]d", function()
			vim.diagnostic.goto_prev()
		end, opts)
		KEYMAP("n", "<leader>lca", function()
			vim.lsp.buf.code_action()
		end, opts)
		KEYMAP("n", "<leader>lrr", function()
			vim.lsp.buf.references()
		end, opts)
		KEYMAP("n", "<leader>lrn", function()
			vim.lsp.buf.rename()
		end, opts)
		KEYMAP("i", "<C-h>", function()
			vim.lsp.buf.signature_help()
		end, opts)
	end

	local on_attach = function(client, bufnr)
		lsp_keymaps(bufnr)
	end

	for _, server in pairs(require("lsp_dependencies").servers) do
		local opts = {
			on_attach = on_attach,
			capabilities = capabilities,
		}

		server = vim.split(server, "@")[1]

		local require_ok, conf_opts = pcall(require, "settings." .. server)

		if require_ok then
			opts = vim.tbl_deep_extend("force", conf_opts, opts)
		end

		lspconfig[server].setup(opts)
	end

	for _, sign in ipairs(sign_icons) do
		vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = "" })
	end

	local config = {
		virtual_text = true,
		signs = {
			active = sign_icons,
		},
		update_in_insert = true,
		underline = true,
		severity_sort = true,
		float = {
			focusable = false,
			style = "minimal",
			border = "rounded",
			source = "always",
			header = "",
			prefix = "",
			suffix = "",
		},
	}

	local cmp = require("cmp")
	local luasnip = require("luasnip")
	require("luasnip.loaders.from_snipmate").lazy_load()

	cmp.setup({
		snippet = {
			expand = function(args)
				luasnip.lsp_expand(args.body) -- For `luasnip` users.
			end,
		},
		mapping = cmp.mapping.preset.insert({
			["<C-k>"] = cmp.mapping.select_prev_item(),
			["<C-j>"] = cmp.mapping.select_next_item(),
			["<C-u>"] = cmp.mapping(cmp.mapping.scroll_docs(-5), { "i", "c" }),
			["<C-d>"] = cmp.mapping(cmp.mapping.scroll_docs(5), { "i", "c" }),
			["<C-Space>"] = cmp.mapping(cmp.mapping.complete(), { "i", "c" }),
			["<C-e>"] = cmp.mapping({
				i = cmp.mapping.abort(),
				c = cmp.mapping.close(),
			}),
			["<CR>"] = cmp.mapping.confirm({ select = true }),
			["<C-f>"] = cmp.mapping(function(fallback)
				if luasnip.jumpable(1) then
					luasnip.jump(1)
				else
					fallback()
				end
			end, { "i", "s" }),
			["<C-b>"] = cmp.mapping(function(fallback)
				if luasnip.jumpable(-1) then
					luasnip.jump(-1)
				else
					fallback()
				end
			end, { "i", "s" }),
		}),
		sources = {
			{ name = "nvim_lsp" },
			{ name = "nvim_lua" },
			{ name = "luasnip" },
			{ name = "buffer" },
			{ name = "path" },
		},
		confirm_opts = {
			behavior = cmp.ConfirmBehavior.Replace,
			select = false,
		},
	})

	vim.diagnostic.config(config)

	vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
		border = "rounded",
	})

	vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
		border = "rounded",
	})
end

return M
