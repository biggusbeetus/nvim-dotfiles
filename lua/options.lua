local options = {
	number = true,
	numberwidth = 2,
	expandtab = true,
	cindent = true,
	tabstop = 2,
	softtabstop = 2,
	shiftwidth = 2,
	guicursor = "",
	nu = true,
	smartindent = true,
	hlsearch = false,
	incsearch = true,
	scrolloff = 8,
	signcolumn = "yes",
	updatetime = 50,
	colorcolumn = "80",
	undodir = os.getenv("HOME") .. "/.undodir",
	undofile = true,
	autoread = true,
	termguicolors = true,
	winborder = "double",
}

local globals = {
	netrw_browse_split = 0,
	netrw_banner = 0,
	netrw_winsize = 25,
	skip_ts_context_commentstring_module = true,
	winborder = options.winborder,
}

for k, v in pairs(options) do
	vim.opt[k] = v
end

for k, v in pairs(globals) do
	vim.g[k] = v
end

if vim.fn.isdirectory(options.undodir) ~= true then
	vim.fn.mkdir(options.undodir, "p", "755")
end
