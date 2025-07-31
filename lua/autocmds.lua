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

autocmd('LspAttach', {
    group = bbalanza_augroup,
    callback = function(e)
        local opts = { buffer = e.buf }
        vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
        vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
        vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
        vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, opts)
        vim.keymap.set("n", "<leader>vca", function() vim.lsp.buf.code_action() end, opts)
        vim.keymap.set("n", "<leader>vrr", function() vim.lsp.buf.references() end, opts)
        vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end, opts)
        vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
        vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, opts)
        vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, opts)
    end
})
