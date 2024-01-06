local M = {
  "ggandor/leap.nvim",
  commit = "c390eab0950ea01a0d118c2c3c29db7781430b33",
  lazy = true,
  dependencies = {
    {
      "tpope/vim-repeat",
      commit = "24afe922e6a05891756ecf331f39a1f6743d3d5a"
    }
  }
}

function M.config(_, opts)
  require('leap').setup(opts)
  require('leap').add_default_mappings()
end

return M
