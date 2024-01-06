M = {
  "ibhagwan/fzf-lua",
  -- optional for icon support
  dependencies = { "nvim-tree/nvim-web-devicons" },
}

function M.config(plugin, options)
  plugin.setup(options)

  KEYMAP("n", "<leader>zf", function () require('fzf-lua').files() end, KEYMAP_OPTS)
end

return M
