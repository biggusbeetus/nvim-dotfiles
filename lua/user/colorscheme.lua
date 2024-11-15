local M = {
    'EdenEast/nightfox.nvim',
    lazy = false,
    priority = 1000,
    name = "nightfox",
    scheme = "terafox",
    opts = {
    }
}

function M.config(plugin, opts)

  require(plugin.name).setup(opts)
  local status_ok, _ = pcall(vim.cmd.colorscheme, plugin.scheme)
  if not status_ok then
    print("Could not apply colorscheme")
    return
  end
end

return M
