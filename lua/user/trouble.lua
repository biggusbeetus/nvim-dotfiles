local M = {
  "folke/trouble.nvim",
  commit = "85bedb7eb7fa331a2ccbecb9202d8abba64d37b3",
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
