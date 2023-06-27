local options ={
  number = true,
  expandtab = true,
  cindent = true,
  tabstop = 2,
  shiftwidth = 2,
}

local globals = {
  mapleader = ";",
  maplocalleader = ";",
}

for k, v in pairs(options) do
	vim.opt[k] = v
end

for k, v in pairs(globals) do
  vim.g[k] = v
end

-- vim.g.EasyMotion_startofline = 0
