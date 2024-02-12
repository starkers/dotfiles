local util = require("lspconfig.util")

return {
  cmd = { "templ", "lsp" },
  filetypes = { "templ" },
  root_dir = util.root_pattern("go.mod", ".git"),
}
