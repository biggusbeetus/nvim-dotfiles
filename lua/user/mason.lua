local M = {
  "williamboman/mason.nvim",
  commit = "8024d64e1330b86044fed4c8494ef3dcd483a67c",
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
end

return M
