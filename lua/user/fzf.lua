M = {
     "ibhagwan/fzf-lua",
     commit = "66e620a7a724364809e78a1ae4b5bfe73e37df49",
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
