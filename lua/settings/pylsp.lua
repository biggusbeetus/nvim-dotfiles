local function extra_args()
  local virtual = os.getenv("VIRTUAL_ENV") or "/usr"
  return { "--python-executable", virtual .. "/bin/python3", true}
end

return {
	settings = {
    pylsp = {
      plugins = {
        pylsp_mypy = {
          enabled = true,
          overrides = extra_args(),
          report_progress = true,
          live_mode = true,
        },
      }
    }
	},
}
