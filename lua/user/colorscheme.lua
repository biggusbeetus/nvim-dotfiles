local M = {
    'comfysage/evergarden',
    version = false,
    lazy = false,
    priority = 1000,
    name = 'evergarden',
    opts = {
        contrast_dark = "hard"
    }
}

function M.config(plugin, opts)

  require(plugin.name).setup(opts)
  local status_ok, _ = pcall(vim.cmd.colorscheme, plugin.name)
  if not status_ok then
    print("Could not apply colorscheme")
    return
  end
end

return M
