local M = {
  "folke/trouble.nvim",
  commit = "88a40f1cc3af846b520ae167f0177b5faa148c86",
  opts = {}, -- for default options, refer to the configuration section for custom setup. 
  lazy = false,
}

function M.config(_, opts)
  -- Trouble
  require("trouble").setup(opts)
  KEYMAP("n", "<leader>xq", "<cmd>Trouble quickfix toggle<cr>", KEYMAP_OPTS)
  KEYMAP("n", "<leader>xo", "<cmd>Trouble loclist toggle<cr>", KEYMAP_OPTS)
  KEYMAP("n", "<leader>xx", "<cmd>Trouble diagnostics toggle<cr>", KEYMAP_OPTS)
  KEYMAP("n", "<leader>xl", "<cmd>Trouble lsp toggle focus=false<CR>", KEYMAP_OPTS)
  KEYMAP("n", "<leader>xs", "<cmd>Trouble symbols toggle focus=false<CR>", KEYMAP_OPTS)
end

return M
