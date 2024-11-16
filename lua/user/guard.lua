local M = {
    "nvimdev/guard.nvim",
    -- lazy load by ft
    ft = { "lua", "go", "markdown" },
    -- Builtin configuration, optional
    dependencies = {
        "nvimdev/guard-collection",
    },
}

function M.config(plugin)
    local ft = require('guard.filetype')

-- Assuming you have guard-collection
-- Put this in your ftplugin/lang.lua to lazy load guard
ft('lua'):fmt('stylua')
          :append('lsp')
          :lint('selene')

-- change this anywhere in your config, these are the defaults
vim.g.guard_config = {
    -- format on write to buffer
    fmt_on_save = true,
    -- use lsp if no formatter was defined for this filetype
    lsp_as_default_formatter = true,
    -- whether or not to save the buffer after formatting
    save_on_fmt = true,
}
		KEYMAP("n", "<leader>lf", "Guard fmt", KEYMAP_OPTS)
end
return M
