local opts = { noremap = true, silent = true }

local keymap = vim.keymap.set


keymap("v", "J", ":m '>+1<CR>gv=gv")
keymap("v", "K", ":m '<-2<CR>gv=gv")

keymap("n", "J", "mzJ`z")
keymap("n", "<C-d>", "<C-d>zz")
keymap("n", "<C-u>", "<C-u>zz")
keymap("n", "n", "nzzzv")
keymap("n", "N", "Nzzzv")

keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

-- Navigate buffers
keymap("n", "<S-l>", ":bnext<CR>", opts)
keymap("n", "<S-h>", ":bprevious<CR>", opts)

-- Greatest keymap ever: ThePrimeagen
keymap("x", "<leader>p", [["_dP]], opts)
-- next greatest remap ever : asbjornHaland
keymap({"n", "v"}, "<leader>y", [["+y]], opts)
keymap("n", "<leader>Y", [["+Y]], opts)
keymap({"n", "v"}, "<leader>d", [["_d]], opts)

-- Harpoon keymaps
local mark = require("harpoon.mark")
local ui = require("harpoon.ui")

keymap("n", "<leader>a", mark.add_file, opts)
keymap("n", "<C-e>", ui.toggle_quick_menu, opts)
keymap("n", "<leader>1", function() ui.nav_file(1) end, opts)
keymap("n", "<leader>2", function() ui.nav_file(2) end, opts)
keymap("n", "<leader>3", function() ui.nav_file(3) end, opts)
keymap("n", "<leader>4", function() ui.nav_file(4) end, opts)

-- Leap
require('leap').add_default_mappings()

-- Nvimtree
keymap("n", "<leader>e", ":NvimTreeToggle<CR>", opts)

-- Telescope
keymap("n", "<leader>ff", ":Telescope find_files<CR>", opts)
keymap("n", "<leader>ft", ":Telescope live_grep<CR>", opts)
keymap("n", "<leader>fp", ":Telescope projects<CR>", opts)
keymap("n", "<leader>fb", ":Telescope buffers<CR>", opts)

-- Trouble
keymap("n", "<leader>xq", "<cmd>TroubleToggle quickfix<cr>", opts)

-- Lsp
keymap("n", "<leader>lf", "<cmd>lua vim.lsp.buf.format{ async = true }<cr>", opts)
