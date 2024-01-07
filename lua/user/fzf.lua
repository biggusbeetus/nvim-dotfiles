M = {
  "ibhagwan/fzf-lua",
  event = "VeryLazy",
  dependencies = { "nvim-tree/nvim-web-devicons" },
}

function M.config(plugin, options)
  require(plugin.name).setup(options)
  KEYMAP("n", "<leader>fz", function () require('fzf-lua').files() end, KEYMAP_OPTS)
end

return M
