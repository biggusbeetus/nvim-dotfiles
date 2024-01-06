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
-- KEYMAP("n", "<S-l>", ":bnext<CR>", KEYMAP_OPTS)
-- KEYMAP("n", "<S-h>", ":bprevious<CR>", KEYMAP_OPTS)
KEYMAP("n", "<leader>bd", ":bd<CR>", KEYMAP_OPTS)
KEYMAP("n", "<leader>wd", "<C-w>c", KEYMAP_OPTS)
KEYMAP("n", "<leader>wv", "<C-w>v", KEYMAP_OPTS)
KEYMAP("n", "<leader>ws", "<C-w>s", KEYMAP_OPTS)
KEYMAP("n", "<leader>wo", "<C-w>o", KEYMAP_OPTS)
KEYMAP("n", "<leader>we", "<C-w>=", KEYMAP_OPTS)

-- Greatest keymap ever: ThePrimeagen
KEYMAP("x", "<leader>p", [["_dP]], KEYMAP_OPTS)
-- next greatest remap ever : asbjornHaland
KEYMAP({ "n", "v" }, "<leader>y", [["+y]], KEYMAP_OPTS)
KEYMAP("n", "<leader>Y", [["+Y]], KEYMAP_OPTS)
KEYMAP({ "n", "v" }, "<leader>d", [["_d]], KEYMAP_OPTS)

-- Netrw
KEYMAP("n", "<leader>e", "<cmd>Explore<CR>", KEYMAP_OPTS)

-- Go to config files
KEYMAP("n", "<leader>vpp", "<cmd>e ~/.config/nvim/<CR>", KEYMAP_OPTS)

