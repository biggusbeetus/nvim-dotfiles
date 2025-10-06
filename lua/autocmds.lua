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
		KEYMAP("n", "<leader>e", "<cmd>Rex<CR>", opts)
		KEYMAP("n", "<leader>rd", recursive_delete, opts)
	end,
})

autocmd("filetype", {
    pattern = "liquid",
    callback = function ()
        vim.cmd.TSDisable "highlight"
    end
})

autocmd('TextYankPost', {
    group = bbalanza_augroup,
    pattern = '*',
    callback = function()
        vim.highlight.on_yank({
            higroup = 'IncSearch',
            timeout = 40,
        })
    end,
})

autocmd('LspAttach', {
    group = bbalanza_augroup,
    callback = function(e)
        local opts = { buffer = e.buf }
        vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
        vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
        vim.keymap.set("n", "<leader>ws", function() vim.lsp.buf.workspace_symbol() end, opts)
        vim.keymap.set("n", "<leader>d", function() vim.diagnostic.open_float() end, opts)
        vim.keymap.set("n", "<leader>ca", function() vim.lsp.buf.code_action() end, opts)
        vim.keymap.set("n", "<leader>rr", function() vim.lsp.buf.references() end, opts)
        vim.keymap.set("n", "<leader>rn", function() vim.lsp.buf.rename() end, opts)
        vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
        vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, opts)
        vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, opts)
    end
})

autocmd({"BufWritePre"}, {
    group = bbalanza_augroup,
    pattern = "*",
    command = [[%s/\s\+$//e]],
})


