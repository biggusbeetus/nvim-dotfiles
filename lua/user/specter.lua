local M = {
  'nvim-pack/nvim-spectre',
  commit = '366f46fdd4a1593cc237aea13d5ef113739a472c',
  depenencies = {
    'nvim-lua/plenary.nvim'
  }
}

function M.config(_, opts)
  local spectre = require("spectre")
  spectre.setup(opts)

end

return M
