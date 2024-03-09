local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities

local lspconfig = require "lspconfig"

-- if you just want default config for the servers then put them in a table
-- see: https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md
local servers = {
  "html",
  "cssls",
  "tsserver",
  -- "clangd",
  "tailwindcss",
  "templ",
  -- "lua_ls",
  "htmx",
  "golangci_lint_ls",
  "gopls",
  "dockerls",
  "yamlls",
  -- "lua",
  -- "lua-language-server",
  -- "golangci-lint-langserver",
}

for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = on_attach,
    capabilities = capabilities,
  }
end

-- 
-- lspconfig.pyright.setup { blabla}
