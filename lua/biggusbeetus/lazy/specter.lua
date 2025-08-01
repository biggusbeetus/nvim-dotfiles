local M = {
  'nvim-pack/nvim-spectre',
  commit = '366f46fdd4a1593cc237aea13d5ef113739a472c',
  dependencies = {
    'nvim-lua/plenary.nvim'
  }
}

function M.config(_, opts)
  local spectre = require("spectre")
  spectre.setup(opts)

  KEYMAP("n", "<leader>SS", function () spectre.toggle() end, KEYMAP_OPTS)
  KEYMAP("n", "<leader>SW", function () spectre.open_visual({select_word=true}) end, KEYMAP_OPTS)
  KEYMAP("n", "<leader>SF", function () spectre.open_file_search({select_word=true}) end, KEYMAP_OPTS)

end

return M
