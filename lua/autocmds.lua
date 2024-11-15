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

local function default_trouble_quick_fix(args)
    local bufnr = args.buf
    vim.defer_fn(function()
      local winid = vim.fn.bufwinid(bufnr)
      if winid == -1 then
        return
      end
      vim.api.nvim_win_close(winid, true)
      require("trouble").open "quickfix"
    end, 0)
end
autocmd("filetype", {
	group = bbalanza_augroup,
	pattern = "netrw",
	callback = function()
		KEYMAP("n", "<leader>e", "<cmd>Rex<CR>", opts)
		KEYMAP("n", "<leader>rd", recursive_delete, opts)
	end,
})

autocmd("filetype", {
  pattern = "qf",
  callback = function(args)
    default_trouble_quick_fix(args)
  end,
})
