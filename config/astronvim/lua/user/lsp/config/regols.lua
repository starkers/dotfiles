local util = require("lspconfig.util")

return {
	cmd = { "regols" },
	filetypes = { "rego" },
	root_dir = util.root_pattern(".git"),
}
