local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities

local lspconfig = require "lspconfig"

local utils = require("lspconfig/util")


-- if you just want default config for the servers then put them in a table
-- see: https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md
local generic_servers = {
  "html",
  "cssls",
  "tsserver",
  "clangd" ,
  "templ",
  -- "lua_ls",
}

for _, lsp in ipairs(generic_servers) do
  lspconfig[lsp].setup {
    on_attach = on_attach,
    capabilities = capabilities,
  }
end

-- 
-- lspconfig.pyright.setup { blabla}
lspconfig.pyright.setup({
  on_attach = on_attach,
  capabilities = capabilities,
  filetypes = { "python" },
})



lspconfig.eslint.setup({
  on_attach = on_attach,
  capabilities = capabilities,
  root_dir = utils.root_pattern("package.json"),
})

