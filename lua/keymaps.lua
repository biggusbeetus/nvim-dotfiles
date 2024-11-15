local keymap_namespace = vim.api.nvim_create_namespace("custom_keymaps")

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

-- Naviagate windows
KEYMAP("n", "<leader>c", "<C-w>c", KEYMAP_OPTS)
KEYMAP("n", "<leader>vv", "<C-w>v", KEYMAP_OPTS)
KEYMAP("n", "<leader>s", "<C-w>s", KEYMAP_OPTS)
KEYMAP("n", "<leader>wo", "<C-w>o", KEYMAP_OPTS)
KEYMAP("n", "<leader>we", "<C-w>=", KEYMAP_OPTS)

-- Buffers
KEYMAP("n", "<leader>bd", ":%bd|e#<CR>", KEYMAP_OPTS)

-- Greatest keymap ever: ThePrimeagen
KEYMAP("x", "<leader>p", [["_dP]], KEYMAP_OPTS)
-- next greatest remap ever : asbjornHaland
KEYMAP({ "n", "v" }, "<leader>y", [["+y]], KEYMAP_OPTS)
KEYMAP("n", "<leader>Y", [["+Y]], KEYMAP_OPTS)
KEYMAP({ "n", "v" }, "<leader>d", [["_d]], KEYMAP_OPTS)

-- Netrw
KEYMAP("n", "<leader>e", "<cmd>Ex<CR>", KEYMAP_OPTS)

-- Go to config files
KEYMAP("n", "<leader>vpp", "<cmd>e ~/.config/nvim/<CR>", KEYMAP_OPTS)

-- Leap
local leap = require("leap")
leap.add_default_mappings()

-- Spectre
local spectre = require("spectre")
KEYMAP("n", "<leader>SS", function () spectre.toggle() end, KEYMAP_OPTS)
KEYMAP("n", "<leader>SW", function () spectre.open_visual({select_word=true}) end, KEYMAP_OPTS)
KEYMAP("n", "<leader>SF", function () spectre.open_file_search({select_word=true}) end, KEYMAP_OPTS)
