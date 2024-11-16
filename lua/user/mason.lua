local M = {
  "williamboman/mason.nvim",
  commit = "4546dec8b56bc56bc1d81e717e4a935bc7cd6477",
  cmd = "Mason",
  event = { "BufReadPre", "BufNewFile" },
  opts = {
    install_root_dir = os.getenv("HOME") .. "/.mason",
    ui = {
      border = "none",
      icons = {
        package_installed = "◍",
        package_pending = "◍",
        package_uninstalled = "◍",
      },
    },
    log_level = vim.log.levels.INFO,
    max_concurrent_installers = 4,
  },
  dependencies = {
    {
      "williamboman/mason-lspconfig.nvim",
      commit = "93e58e100f37ef4fb0f897deeed20599dae9d128",
      lazy = true,
    },
  },
}

function M.config(lazyPlugin, opts)
  require("mason").setup(opts)

  local dependencies = require("lsp_dependencies")
  local to_install = dependencies.servers
  for k,v in pairs(dependencies.other) do to_install[k] = v end

  require("mason-lspconfig").setup({
    ensure_installed = to_install,
    automatic_installation = true,
  })

end

return M
