local M = {
	"neovim/nvim-lspconfig",
	commit = "796394fd19fb878e8dbc4fd1e9c9c186ed07a5f4",
	lazy = false,
	event = { "BufReadPre" },
	dependencies = {
		{
			"hrsh7th/cmp-nvim-lsp",
			commit = "5af77f54de1b16c34b23cba810150689a3a90312",
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
		KEYMAP("n", "<leader>lws", function()
			vim.lsp.buf.workspace_symbol()
		end, opts)
		KEYMAP("n", "<leader>le", function()
			vim.diagnostic.open_float({source = 'if_many', virtual_text = true})
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
		KEYMAP("n", "<leader>lf", function()
			vim.lsp.buf.format({ async = true })
		end, KEYMAP_OPTS)
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

	vim.diagnostic.config(config)

	vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
		border = "rounded",
	})

	vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
		border = "rounded",
	})
end

return M
