local lazypath = os.getenv("HOME") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

vim.g.mapleader = ";"
vim.g.maplocalleader = ";"

-- load lazy
require("lazy").setup("user", {
  install = { colorscheme = { require("user.colorscheme").name} },
  defaults = { lazy = true, version = "96584866b9c5e998cbae300594d0ccfd0c464627" },
  ui = { wrap = "true" },
  change_detection = { enabled = true },
  debug = false,
  performance = {
    rtp = {
      disabled_plugins = {
      },
    },
  },
})

