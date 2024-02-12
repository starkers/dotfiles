local util = require("lspconfig.util")

return {
	cmd = { "kcl-language-server" },
	filetypes = { "kcl" },
	root_dir = util.root_pattern(".git"),
}
