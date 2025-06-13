local lazypath = os.getenv("HOME") .. "/.lazy/lazy.nvim"
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

-- load lazy
require("lazy").setup("user", {
  install = { colorscheme = { require("user.colorscheme").name} },
  defaults = { lazy = true, version = "6c3bda4aca61a13a9c63f1c1d1b16b9d3be90d7a" },
  lockfile = os.getenv("HOME") .. "/.lazy/lazy-lock.json",
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

