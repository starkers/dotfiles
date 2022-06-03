local null_ls_status_ok, null_ls = pcall(require, "null-ls")
if not null_ls_status_ok then
  return
end

-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/formatting
local formatting = null_ls.builtins.formatting
-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/diagnostics
local diagnostics = null_ls.builtins.diagnostics

-- default path for locally installed languages
-- local path_asdf = vim.fn.expand("$HOME") .. "/.asdf/shims"
local path_cargo = vim.fn.expand("$HOME") .. "/.cargo/bin/"
-- local path_go = vim.fn.expand("$GOPATH") .. "/bin/"
local path_python = vim.fn.expand("$HOME") .. "/.local/bin/"
local path_asdf = vim.fn.expand("$HOME") .. "/.asdf/shims/"

null_ls.setup({
  debug = false,
  sources = {

    -- formatting.black.with({
    --   extra_args = { "--fast" },
    --   command = path_asdf .. "black",
    -- }),

    -- formatting.stylua.with({
    --   command = path_asdf .. "stylua",
    -- }),

    formatting.shfmt.with({
      -- command = path_asdf .. "smfmt",
    }),

    -- -- https://github.com/jose-elias-alvarez/null-ls.nvim/blob/c62050977ca017ba9dc252ca82532ef94105b096/lua/null-ls/builtins/formatting/gofmt.lua#L10
    -- formatting.gofmt.with({
    -- 	command = path_go .. "gofmt",
    -- }),

    -- -- https://github.com/jose-elias-alvarez/null-ls.nvim/blob/c62050977ca017ba9dc252ca82532ef94105b096/lua/null-ls/builtins/formatting/goimports.lua#L10
    -- formatting.goimports.with({
    -- 	command = path_go .. "goimports",
    -- }),

    -- https://github.com/jose-elias-alvarez/null-ls.nvim/blob/c62050977ca017ba9dc252ca82532ef94105b096/lua/null-ls/builtins/formatting/terraform_fmt.lua#L10
    formatting.terraform_fmt.with({
      command = "terraform",
      args = {
        "fmt",
        "-",
      },
      to_stdin = true,
    }),

    -- -- https://github.com/jose-elias-alvarez/null-ls.nvim/blob/c62050977ca017ba9dc252ca82532ef94105b096/lua/null-ls/builtins/formatting/eslint.lua#L19
    -- formatting.eslint.with({
    -- 	command = "eslint",
    -- 	prefer_local = "node_modules/.bin",
    -- }),

    -- format with vanilla 'eslint' please
    formatting.eslint.with({
      prefer_local = "node_modules/.bin",
      -- extra_args = { "--fix-dry-run", "--format", "json", "--stdin", "--stdin-filename", "$FILENAME" },
    }),
    --formatting.prettier.with({
    --	extra_args = { "--no-semi", "--single-quote", "--jsx-single-quote" },
    --	prefer_local = "node_modules/.bin",
    --}),

    -- https://github.com/jose-elias-alvarez/null-ls.nvim/blob/c62050977ca017ba9dc252ca82532ef94105b096/lua/null-ls/builtins/diagnostics/golangci_lint.lua#L10
    -- TODO: golangci-lint + goimports + gofmt automatically? (make null-ls and lsp be friends?)
    -- diagnostics.golangci_lint.with({
    -- 	command = path_go .. "golangci-lint",
    -- }),

    -- vanilla eslint diagnostics also
    diagnostics.eslint.with({
      prefer_local = "node_modules/.bin",
      command = "eslint",
    }),

    diagnostics.flake8.with({
      command = path_python .. "flake8",
    }),

    -- no more
  },



  -- auto-formatting
  -- See: https://github.com/jose-elias-alvarez/null-ls.nvim/blob/c62050977ca017ba9dc252ca82532ef94105b096/README.md?plain=1#L214-L228
  on_attach = function(client)
    -- src: https://github.com/jose-elias-alvarez/null-ls.nvim/issues/436#issuecomment-995322408
    -- prefer null-ls for formatting if available
    if not is_null and null_can_format then
      -- disable formatting for ls
      print("formatting disabled for ls")
      client.server_capabilities.documentFormattingProvider = false
      client.server_capabilities.documentRangeFormattingProvider = false
    elseif is_null and not null_can_format then
      -- disable formatting for null-ls
      print("formatting disabled for null")
      client.supports_method = function(--[[ method ]])
        return false
      end
    else
      -- use client for formatting
      print("formatting enabled")
      vim.cmd("autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()")
    end

    -- if client.resolved_capabilities.document_formatting then
    -- 	vim.cmd([[
    --     augroup LspFormatting
    --         autocmd! * <buffer>
    --         autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()
    --     augroup END
    --     ]])
    -- end
  end,
})
