local lspconfig = require("lspconfig")

return {
  filetypes = { "yaml.ansible", "yaml" },
	root_dir = lspconfig.util.root_pattern(".git"),
}
