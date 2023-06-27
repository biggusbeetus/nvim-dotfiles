local opts = { noremap = true, silent = true }

local keymap = vim.keymap.set

-- Nvimtree
keymap("n", "<leader>e", ":NvimTreeToggle<cr>", opts)

keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

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

