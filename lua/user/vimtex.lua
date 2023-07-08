local M = {
  'lervag/vimtex',
  event = "BufReadPre",
  commit = "b38bbcab7ab05067ce460e2d9e69c896fea7ebe0"
}

function M.config()
  local opts = {
    vimtex_view_general_viewer = "none",
    vimtex_compiler_latexmk_engines = {
      _ = "-xelatex",
    },
    tex_comment_nospell = 1,
    vimtex_compiler_progname = "nvr",
    vimtex_view_general_options = [[--unique file:@pdf\#src:@line@tex]],
    vimtex_quickfix_ignore_filters = {
      "Underfull",
      "Overfull",
      "Negative",
    },
    vimtex_quickfix_mode = 0,
    vimtex_quickfix_autoclose_after_keystrokes = 0,
  }

  for k, v in pairs(opts) do
    vim.g[k] = v
  end
end

return {}
-- return M
