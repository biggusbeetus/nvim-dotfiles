M = {
  "ibhagwan/fzf-lua",
  event = "VimEnter",
  dependencies = { "nvim-tree/nvim-web-devicons" },
}

function M.config(plugin, options)
  local fzf = require('fzf-lua')
  require(plugin.name).setup(options)
  KEYMAP("n", "<leader>ff", function () fzf.files() end, KEYMAP_OPTS)
  KEYMAP("n", "<leader>fb", function () fzf.grep_curbuf() end, KEYMAP_OPTS)
  KEYMAP("n", "<leader>fg", function () fzf.live_grep() end, KEYMAP_OPTS)
  KEYMAP("n", "<leader>fx", function () fzf.quickfix() end, KEYMAP_OPTS)
  KEYMAP("n", "<leader>ls", function () fzf.buffers() end, KEYMAP_OPTS)
  KEYMAP("n", "<leader>fo", function () fzf.oldfiles() end, KEYMAP_OPTS)
end

return M
