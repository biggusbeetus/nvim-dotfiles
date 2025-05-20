local M = {
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
          'honza/vim-snippets',
          commit = 'f0a3184d9f90b96b044d5914625a25c554d7f301',
        },
        {
        "rafamadriz/friendly-snippets",
        commit = "572f5660cf05f8cd8834e096d7b4c921ba18e175",
        },
      },
    },
  },
}

function M.config()
  local cmp = require "cmp"

  local luasnip = require "luasnip"
  require("luasnip.loaders.from_snipmate").lazy_load()

  local check_backspace = function()
    local col = vim.fn.col "." - 1
    return col == 0 or vim.fn.getline("."):sub(col, col):match "%s"
  end

  local kind_icons = {
    Text = "󰉿",
    Method = "m",
    Function = "󰊕",
    Constructor = "",
    Field = "",
    Variable = "󰆧",
    Class = "󰌗",
    Interface = "",
    Module = "",
    Property = "",
    Unit = "",
    Value = "󰎠",
    Enum = "",
    Keyword = "󰌋",
    Snippet = "",
    Color = "󰏘",
    File = "󰈙",
    Reference = "",
    Folder = "󰉋",
    EnumMember = "",
    Constant = "󰇽",
    Struct = "",
    Event = "",
    Operator = "󰆕",
    TypeParameter = "󰊄",
    Codeium = "󰚩",
    Copilot = "",
  }

  cmp.setup {
    snippet = {
      expand = function(args)
        luasnip.lsp_expand(args.body) -- For `luasnip` users.
      end,
    },
    mapping = cmp.mapping.preset.insert {
      ["<C-k>"] = cmp.mapping.select_prev_item(),
      ["<C-j>"] = cmp.mapping.select_next_item(),
      ["<C-u>"] = cmp.mapping(cmp.mapping.scroll_docs(-5), { "i", "c" }),
      ["<C-d>"] = cmp.mapping(cmp.mapping.scroll_docs(5), { "i", "c" }),
      ["<C-Space>"] = cmp.mapping(cmp.mapping.complete(), { "i", "c" }),
      ["<C-e>"] = cmp.mapping {
        i = cmp.mapping.abort(),
        c = cmp.mapping.close(),
      },
      -- Accept currently selected item. If none selected, `select` first item.
      -- Set `select` to `false` to only confirm explicitly selected items.
      ["<CR>"] = cmp.mapping.confirm { select = true },
      ['<C-f>'] = cmp.mapping(function(fallback)
            if luasnip.jumpable(1) then
          luasnip.jump(1)
        else
          fallback()
        end
    end, {'i', 's'}),
          ['<C-b>'] = cmp.mapping(function(fallback)
            if luasnip.jumpable(-1) then
          luasnip.jump(-1)
        else
          fallback()
        end
    end, {'i', 's'}),
    -- ['<Tab>'] = cmp.mapping(function(fallback)
    --         if cmp.visible() then
    --       cmp.select_next_item(select_opts)
    --     elseif luasnip.expand_or_jumpable() then
    --         luasnip.expand_or_jump()
    --     else
    --       fallback()
    --     end
    -- end, {'i', 's'}),
    -- ['<S-Tab>'] = cmp.mapping(function(fallback)
    --         if cmp.visible() then
    --       cmp.select_prev_item(select_opts)
    --     elseif luasnip.jumpable(-1) then
    --         luasnip.jump(-1)
    --     else
    --       fallback()
    --     end
    -- end, {'i', 's'}),
--       ["<Tab>"] = nil,
--       ["<S-Tab>"] = nil,
    },
    formatting = {
      fields = { "kind", "abbr", "menu" },
      format = function(entry, vim_item)
        vim_item.kind = kind_icons[vim_item.kind]
        vim_item.menu = ({
          nvim_lsp = "",
          nvim_lua = "",
          luasnip = "",
          buffer = "",
          path = "",
          emoji = "",
        })[entry.source.name]
        return vim_item
      end,
    },
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
    window = {
      completion = cmp.config.window.bordered(),
      documentation = cmp.config.window.bordered(),
    },
    experimental = {
      ghost_text = true,
    },
  }
end

return M
