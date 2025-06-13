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
  }

end

return M
