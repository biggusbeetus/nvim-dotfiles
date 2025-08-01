local M = {
    'sainnhe/everforest',
    event = {
        "VimEnter",
    },
    lazy = false,
    priority = 1000,
    name = 'everforest',
}

function M.config(plugin)

  vim.g.everforest_background = 'soft'
  local status_ok, _ = pcall(vim.cmd.colorscheme, plugin.name)
  if not status_ok then
    print("Could not apply colorscheme")
    return
  end

  vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
  vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
end

return M
