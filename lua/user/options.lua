local options ={
number = true,
expandtab = true,
cindent = true,
tabstop = 2,
shiftwidth = 2,
}

for k, v in pairs(options) do
	vim.opt[k] = v
end

-- vim.g.EasyMotion_startofline = 0
