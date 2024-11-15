local M = {
  "hrsh7th/nvim-cmp",
  commit = "5260e5e8ecadaf13e6b82cf867a909f54e15fd07",
  event = {
    "InsertEnter",
    "CmdlineEnter",
  },
  dependencies = {
    {
      "hrsh7th/cmp-buffer",
      commit = "3022dbc9166796b644a841a02de8dd1cc1d311fa",
    },
    {
      "hrsh7th/cmp-path",
      commit = "91ff86cd9c29299a64f968ebb45846c485725f23",
    },
    {
      "hrsh7th/cmp-cmdline",
      commit = "23c51b2a3c00f6abc4e922dbd7c3b9aca6992063",
    },
    {
      "saadparwaiz1/cmp_luasnip",
      commit = "18095520391186d634a0045dacaa346291096566",
    },
    {
      "L3MON4D3/LuaSnip",
      version = "v2.*",
      build = "make install_jsregexp",
      -- event = "InsertEnter",
      dependencies = {
        {
          'honza/vim-snippets',
          commit = '96d79529edc3dee1ccf2ce7b75a88cb546ec2501',
        },
        {
        "rafamadriz/friendly-snippets",
        commit = "700c4a25caacbb4648c9a27972c2fe203948e0c2",
        },
      },
    },
    {
      "hrsh7th/cmp-nvim-lua",
      commit = "f3491638d123cfd2c8048aefaf66d246ff250ca6",
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
