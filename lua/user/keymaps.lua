local opts = { noremap = true, silent = true }

local keymap = vim.api.nvim_set_keymap

local function multi_mode_keymap(modes, lhs, rhs, options)
  for _, mode in ipairs(modes) do
    keymap(mode, lhs, rhs, options)
  end
end

-- Nvimtree
keymap("n", "<leader>e", ":NvimTreeToggle<cr>", opts)

keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

keymap("x", "<leader>p", [["_dP]], opts)

-- next greatest remap ever : asbjornHaland
multi_mode_keymap({"n", "v"}, "<leader>y", [["+y]], opts)
keymap("n", "<leader>Y", [["+Y]], opts)
keymap({"n", "v"}, "<leader>d", [["_d]], opts)

