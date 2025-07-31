local M = {
  "williamboman/mason.nvim",
  opts = {
    install_root_dir = os.getenv("HOME") .. "/.mason",
  },
  dependencies = {
    {
      "williamboman/mason-lspconfig.nvim",
      commit = "93e58e100f37ef4fb0f897deeed20599dae9d128",
      lazy = true,
    },
  },
}

function M.config(_, opts)
  require("mason").setup(opts)
end

return M
