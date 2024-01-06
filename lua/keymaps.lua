KEYMAP_OPTS = { noremap = true, silent = true }

KEYMAP = vim.keymap.set

KEYMAP("v", "J", ":m '>+1<CR>gv=gv")
KEYMAP("v", "K", ":m '<-2<CR>gv=gv")

KEYMAP("n", "J", "mzJ`z")
KEYMAP("n", "<C-d>", "<C-d>zz")
KEYMAP("n", "<C-u>", "<C-u>zz")
KEYMAP("n", "n", "nzzzv")
KEYMAP("n", "N", "Nzzzv")

KEYMAP("n", "<C-h>", "<C-w>h", KEYMAP_OPTS)
KEYMAP("n", "<C-j>", "<C-w>j", KEYMAP_OPTS)
KEYMAP("n", "<C-k>", "<C-w>k", KEYMAP_OPTS)
KEYMAP("n", "<C-l>", "<C-w>l", KEYMAP_OPTS)

-- Navigate buffers
KEYMAP("n", "<S-l>", ":bnext<CR>", KEYMAP_OPTS)
KEYMAP("n", "<S-h>", ":bprevious<CR>", KEYMAP_OPTS)
KEYMAP("n", "<leader>c", ":bd<CR>", KEYMAP_OPTS)

-- Greatest keymap ever: ThePrimeagen
KEYMAP("x", "<leader>p", [["_dP]], KEYMAP_OPTS)
-- next greatest remap ever : asbjornHaland
KEYMAP({ "n", "v" }, "<leader>y", [["+y]], KEYMAP_OPTS)
KEYMAP("n", "<leader>Y", [["+Y]], KEYMAP_OPTS)
KEYMAP({ "n", "v" }, "<leader>d", [["_d]], KEYMAP_OPTS)

-- Harpoon keymaps
local mark = require("harpoon.mark")
local ui = require("harpoon.ui")

KEYMAP("n", "<leader>a", mark.add_file, KEYMAP_OPTS)
KEYMAP("n", "<C-e>", ui.toggle_quick_menu, KEYMAP_OPTS)
KEYMAP("n", "<leader>1", function()
	ui.nav_file(1)
end, KEYMAP_OPTS)
KEYMAP("n", "<leader>2", function()
	ui.nav_file(2)
end, KEYMAP_OPTS)
KEYMAP("n", "<leader>3", function()
	ui.nav_file(3)
end, KEYMAP_OPTS)
KEYMAP("n", "<leader>4", function()
	ui.nav_file(4)
end, KEYMAP_OPTS)

-- Leap
require("leap").add_default_mappings()

-- Netrw
KEYMAP("n", "<leader>e", "<cmd>Explore<CR>", KEYMAP_OPTS)

-- Telescope
KEYMAP("n", "<leader>ff", function() require("telescope.builtin").find_files({hidden = true}) end, KEYMAP_OPTS)
KEYMAP("n", "<leader>fo", function() require("telescope.builtin").oldfiles() end, KEYMAP_OPTS)
KEYMAP("n", "<leader>ft", function() require("telescope.builtin").live_grep({additional_args = "-u"}) end, KEYMAP_OPTS)
KEYMAP("n", "<leader>fg", function() require("telescope.builtin").git_files() end, KEYMAP_OPTS)
KEYMAP("n", "<leader>ls", function() require("telescope.builtin").buffers() end, KEYMAP_OPTS)
KEYMAP("n", "<leader>bf", function() require("telescope").extensions.file_browser.file_browser() end, KEYMAP_OPTS)
KEYMAP("n", "<leader>fp", ":Telescope projects<CR>", KEYMAP_OPTS)


-- Lsp
KEYMAP("n", "<leader>lf", "<cmd>lua vim.lsp.buf.format{ async = true }<cr>", KEYMAP_OPTS)

-- Fugitive
KEYMAP("n", "<leader>gs", vim.cmd.Git, KEYMAP_OPTS)

-- Go to config files
KEYMAP("n", "<leader>vpp", "<cmd>e ~/.config/nvim/<CR>", KEYMAP_OPTS)

-- Undotree
KEYMAP(
	"n",
	"<leader>u",
	vim.cmd.UndotreeToggle,
	KEYMAP_OPTS
)

-- Cellular automaton
KEYMAP("n", "<leader>mr", "<cmd>CellularAutomaton make_it_rain<CR>", KEYMAP_OPTS)
KEYMAP("n", "<leader>ol", "<cmd>CellularAutomaton game_of_life<CR>", KEYMAP_OPTS)

