local M = {
    'sainnhe/everforest',
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
end

return M
