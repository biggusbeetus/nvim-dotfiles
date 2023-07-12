local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

local bbalanza_augroup = augroup("bbalanza", {})
local opts = { remap = true, buffer = true }

local function recursive_delete()
	local filetype = vim.bo.filetype
	if filetype == "netrw" then
		KEYMAP("c", "<CR>", "rm -rf<CR>", { remap = false, buffer = true })
		vim.cmd.normal("mu")
		vim.cmd.normal("mf")
    local ok, _ = pcall(vim.cmd.normal, "mx")
		if ok == false then
		  vim.cmd.normal("mf")
			print("Canceled")
		end
		vim.keymap.del("c", "<CR>", { buffer = true })
	end
end

autocmd("filetype", {
	group = bbalanza_augroup,
	pattern = "netrw",
	callback = function()
		KEYMAP("n", "<leader>e", ":bd<CR>", opts)
		KEYMAP("n", "<leader>rd", recursive_delete, opts)
	end,
})

autocmd("BufWritePost", {
  group = bbalanza_augroup,
  pattern = {"*.js","*.html", "*.css", "*.ts"},
  callback = function ()
    local cwd = vim.loop.cwd()
    local www = "/workspace/var/www/balanza.dev/"
    vim.cmd("!rm -rf " .. www .. "*")
    vim.cmd("!cp -r " .. cwd .. "/src/* " .. www)
  end
})
