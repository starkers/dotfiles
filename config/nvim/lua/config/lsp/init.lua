-- require("workspace").setup()
require("lua-dev").setup({})

require("nvim-lsp-installer").setup({
  automatic_installation = true,
})

require("config.lsp.diagnostics").setup()
require("config.lsp.kind").setup()

local function on_attach(client, bufnr)
  require("nvim-navic").attach(client, bufnr)
  require("config.lsp.formatting").setup(client, bufnr)
  require("config.lsp.keys").setup(client, bufnr)
  -- require("config.lsp.completion").setup(client, bufnr)
  require("config.lsp.highlighting").setup(client)

  -- TypeScript specific stuff
  if client.name == "typescript" or client.name == "tsserver" then
    require("config.lsp.ts-utils").setup(client)

    -- NOTE: just an experiment below.. please ignore
    -- local util = require("util")
    -- local function file_exists(name)
    --   local f = io.open(name, "r")
    --   if f ~= nil then io.close(f) return true else return false end
    -- end
    --
    -- -- TODO: how to disable null-ls 'eslint' and 'prettier' for deno projects?
    -- -- is it deno?
    -- if file_exists('deno.json') or file_exists("deno.jsonc") then
    --   util.info("found: TypeScript(deno)", "Project Type Detection")
    --   client.server_capabilities.document_formatting = false
    -- else
    --   util.info("found: TypeScript", "Project Type Detection")
    --   require("config.lsp.ts-utils").setup(client)
    -- end
  end
end

local servers = {
  -- ansiblels = {},
  bashls = {},
  clangd = {},
  cssls = {},
  denols = {},
  dockerls = {},
  eslint = {},
  html = {},
  gopls = {},
  jsonls = {},
  pyright = {},
  rnix = {},
  -- rust_analyzer = {
  --   settings = {
  --     ["rust-analyzer"] = {
  --       cargo = { allFeatures = true },
  --       -- enable clippy on save
  --       checkOnSave = {
  --         command = "clippy",
  --         extraArgs = { "--no-deps" },
  --       },
  --     },
  --   },
  -- },
  sumneko_lua = {
    settings = {
      Lua = {
        diagnostics = {
          -- stop moaning about vim global..
          globals = { "vim" },
        },
      },
    },
  },
  tflint = {},

  -- TODO: how to disable me for deno?
  tsserver = {},

  vimls = {},
  -- volar = {},
  vuels = {},
  -- tailwindcss = {},
}

local capabilities = require("cmp_nvim_lsp").update_capabilities(vim.lsp.protocol.make_client_capabilities())

local options = {
  on_attach = on_attach,
  capabilities = capabilities,
  flags = {
    debounce_text_changes = 150,
  },
}

for server, opts in pairs(servers) do
  opts = vim.tbl_deep_extend("force", {}, options, opts or {})
  require("lspconfig")[server].setup(opts)
end

require("config.lsp.null-ls").setup(options)
-- require("config.lsp.install").setup(servers, options)
