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
	pattern = "*.tex",
	callback = function()
		local uv = vim.loop
		local stdout = uv.new_pipe(false)
		local stderr = uv.new_pipe(false)

		local buffer = ""

		local handle
		handle, _ = uv.spawn("xelatex", {
			stdio = { stdout, stderr },
			args = { "--halt-on-error", "main" },
		}, vim.schedule_wrap(function(code)
				stdout:read_stop()
        stderr:read_stop()
				stdout:close()
				stderr:close()
				handle:close()
        if code == 1 then
				  vim.notify(buffer, vim.log.levels.WARN)
        else
          vim.notify("Latex compiled successfully!", vim.log.levels.INFO)
        end
			end))

		uv.read_start(stderr, function(err, data)
			assert(not err, err)
			if data then
				buffer = data .. buffer
			end
		end)

		uv.read_start(stdout, function(err, data)
			assert(not err, err)
			if data then
				buffer = data .. buffer
			end
		end)
	end,
})
