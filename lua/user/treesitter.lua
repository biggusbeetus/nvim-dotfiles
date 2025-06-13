local dir = os.getenv("HOME") .. "/.treesitter"
local M = {
	"nvim-treesitter/nvim-treesitter",
	commit = "f976acdc9c8214145a11372d2a7ae4a032f62a39",
	event = "VimEnter",
    opts = {
		install_dir = dir
    }
}
function M.config(_, opts)
    vim.opt.runtimepath:prepend(dir)
	local treesitter = require("nvim-treesitter")
    treesitter.setup(opts)
    treesitter.install {
	"lua",
	"bash",
    "go",
    "python"
        }
    vim.api.nvim_create_autocmd('FileType', {
        pattern = treesitter_langs,
        callback = function()
          vim.treesitter.start()
        end,
    })
end

return M

