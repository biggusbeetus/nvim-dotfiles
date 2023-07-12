local M = {
  "VonHeikemen/lsp-zero.nvim",
  branch = "v2.x",
  event = "BufReadPre",
  dependencies = {
    -- LSP Support
    { "neovim/nvim-lspconfig",
      event = "BufReadPre",
      commit = "649137cbc53a044bffde36294ce3160cb18f32c7" },
    {
      "hrsh7th/cmp-nvim-lsp",
      commit = "0e6b2ed705ddcff9738ec4ea838141654f12eeef",
    },
  },
}

function M.config()
  local lsp = require("lsp-zero")

  lsp.preset("recommended")

  lsp.ensure_installed(require("lsp_dependencies").servers)

  -- Fix Undefined global 'vim'
  --lsp.nvim_workspace()

  local cmp = require("cmp")
  local cmp_select = { behavior = cmp.SelectBehavior.Select }
  local cmp_mappings = lsp.defaults.cmp_mappings({
    ["<C-p>"] = cmp.mapping.select_prev_item(cmp_select),
    ["<C-n>"] = cmp.mapping.select_next_item(cmp_select),
    ["<C-y>"] = cmp.mapping.confirm({ select = true }),
    ["<C-Space>"] = cmp.mapping.complete(),
  })

  cmp_mappings["<Tab>"] = nil
  cmp_mappings["<S-Tab>"] = nil

  lsp.setup_nvim_cmp({
    mapping = cmp_mappings,
  })

  lsp.set_preferences({
    suggest_lsp_servers = false,
    sign_icons = {
      error = "E",
      warn = "W",
      hint = "H",
      info = "I",
    },
  })

  lsp.on_attach(function(client, bufnr)
    local opts = { buffer = bufnr, remap = false }

    KEYMAP("n", "gd", function()
      vim.lsp.buf.definition()
    end, opts)
    KEYMAP("n", "K", function()
      vim.lsp.buf.hover()
    end, opts)
    KEYMAP("n", "<leader>vws", function()
      vim.lsp.buf.workspace_symbol()
    end, opts)
    KEYMAP("n", "<leader>vd", function()
      vim.diagnostic.open_float()
    end, opts)
    KEYMAP("n", "[d", function()
      vim.diagnostic.goto_next()
    end, opts)
    KEYMAP("n", "]d", function()
      vim.diagnostic.goto_prev()
    end, opts)
    KEYMAP("n", "<leader>vca", function()
      vim.lsp.buf.code_action()
    end, opts)
    KEYMAP("n", "<leader>vrr", function()
      vim.lsp.buf.references()
    end, opts)
    KEYMAP("n", "<leader>vrn", function()
      vim.lsp.buf.rename()
    end, opts)
    KEYMAP("i", "<C-h>", function()
      vim.lsp.buf.signature_help()
    end, opts)
  end)

  for _, server in pairs(require("lsp_dependencies").servers) do
    local require_ok, conf_opts = pcall(require, "settings." .. server)
    if require_ok then
      lsp.configure(server, conf_opts)
    end
  end

  lsp.setup()

  vim.diagnostic.config({
    virtual_text = true,
  })
end

return M
