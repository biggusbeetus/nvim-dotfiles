local opts = { noremap = true, silent = true }

KEYMAP = vim.keymap.set

KEYMAP("v", "J", ":m '>+1<CR>gv=gv")
KEYMAP("v", "K", ":m '<-2<CR>gv=gv")

KEYMAP("n", "J", "mzJ`z")
KEYMAP("n", "<C-d>", "<C-d>zz")
KEYMAP("n", "<C-u>", "<C-u>zz")
KEYMAP("n", "n", "nzzzv")
KEYMAP("n", "N", "Nzzzv")

KEYMAP("n", "<C-h>", "<C-w>h", opts)
KEYMAP("n", "<C-j>", "<C-w>j", opts)
KEYMAP("n", "<C-k>", "<C-w>k", opts)
KEYMAP("n", "<C-l>", "<C-w>l", opts)

-- Navigate buffers
KEYMAP("n", "<S-l>", ":bnext<CR>", opts)
KEYMAP("n", "<S-h>", ":bprevious<CR>", opts)
KEYMAP("n", "<leader>c", ":bd<CR>", opts)

-- Greatest keymap ever: ThePrimeagen
KEYMAP("x", "<leader>p", [["_dP]], opts)
-- next greatest remap ever : asbjornHaland
KEYMAP({ "n", "v" }, "<leader>y", [["+y]], opts)
KEYMAP("n", "<leader>Y", [["+Y]], opts)
KEYMAP({ "n", "v" }, "<leader>d", [["_d]], opts)

-- Harpoon keymaps
local mark = require("harpoon.mark")
local ui = require("harpoon.ui")

KEYMAP("n", "<leader>a", mark.add_file, opts)
KEYMAP("n", "<C-e>", ui.toggle_quick_menu, opts)
KEYMAP("n", "<leader>1", function()
	ui.nav_file(1)
end, opts)
KEYMAP("n", "<leader>2", function()
	ui.nav_file(2)
end, opts)
KEYMAP("n", "<leader>3", function()
	ui.nav_file(3)
end, opts)
KEYMAP("n", "<leader>4", function()
	ui.nav_file(4)
end, opts)

-- Leap
require("leap").add_default_mappings()

-- Netrw
KEYMAP("n", "<leader>e", "<cmd>Explore<CR>", opts)

-- Telescope
KEYMAP("n", "<leader>ff", ":Telescope find_files<CR>", opts)
KEYMAP("n", "<leader>ft", ":Telescope live_grep<CR>", opts)
KEYMAP("n", "<leader>fg", ":Telescope git_files<CR>", opts)
KEYMAP("n", "<leader>fb", ":Telescope buffers<CR>", opts)
KEYMAP("n", "<leader>fp", ":Telescope projects<CR>", opts)

-- Trouble
KEYMAP("n", "<leader>xx", "<cmd>TroubleToggle<cr>", opts)
KEYMAP("n", "<leader>xw", "<cmd>TroubleToggle workspace_diagnostics<cr>", opts)
KEYMAP("n", "<leader>xd", "<cmd>TroubleToggle document_diagnostics<cr>", opts)
KEYMAP("n", "<leader>xl", "<cmd>TroubleToggle loclist<cr>", opts)
KEYMAP("n", "<leader>xq", "<cmd>TroubleToggle quickfix<cr>", opts)
KEYMAP("n", "gR", "<cmd>TroubleToggle lsp_references<cr>", opts)

-- Lsp
KEYMAP("n", "<leader>lf", "<cmd>lua vim.lsp.buf.format{ async = true }<cr>", opts)

-- Fugitive
KEYMAP("n", "<leader>gs", vim.cmd.Git, opts)

-- Go to config files
KEYMAP("n", "<leader>vpp", "<cmd>e ~/.config/nvim/<CR>", opts)

-- Undotree
KEYMAP(
	"n",
	"<leader>u",
	vim.cmd.UndotreeToggle,
	opts
)

-- Cellular automaton
KEYMAP("n", "<leader>mr", "<cmd>CellularAutomaton make_it_rain<CR>", opts)
KEYMAP("n", "<leader>ol", "<cmd>CellularAutomaton game_of_life<CR>", opts)
