local M = {}

function M.setup(options)
  local nls = require("null-ls")
  nls.setup({
    debounce = 150,
    save_after_format = false,
    sources = {

      -- https://github.com/jose-elias-alvarez/null-ls.nvim/blob/main/doc/BUILTINS.md

      -- -- TODO: test more eslint
      -- nls.builtins.formatting.eslint_d,
      nls.builtins.formatting.eslint.with({
        -- prefer_local = "node_modules/.bin",
        -- extra_args = { "--fix", "--format", "json", "--stdin", "--stdin-filename", "$FILENAME" },
        -- prefer_local = "node_modules/.bin",
        -- command = "vscode-eslint-language-server --stdio",
      }),



      -- https://github.com/jose-elias-alvarez/null-ls.nvim/blob/c62050977ca017ba9dc252ca82532ef94105b096/lua/null-ls/builtins/formatting/terraform_fmt.lua#L10
      nls.builtins.formatting.terraform_fmt.with({
        command = "terraform",
        args = {
          "fmt",
          "-",
        },
        to_stdin = true,
      }),

      -- -- format with vanilla 'eslint' please
      -- nls.builtins.formatting.eslint.with({
      --   prefer_local = "node_modules/.bin",
      --   extra_args = { "--fix-dry-run", "--format", "json", "--stdin", "--stdin-filename", "$FILENAME" },
      -- }),

      nls.builtins.formatting.black.with({
        extra_args = { "--fast" },
      }),

      nls.builtins.formatting.shfmt,
      nls.builtins.formatting.goimports,
      -- nls.builtins.formatting.vue,
      -- nls.builtins.formatting.vuels,
      -- nls.builtins.formatting.volar,
      nls.builtins.formatting.prettierd,
      -- nls.builtins.formatting.stylua,  --works but let normal LSP handle lua
      nls.builtins.formatting.fish_indent,
      nls.builtins.formatting.fixjson.with({ filetypes = { "jsonc" } }),
      -- nls.builtins.formatting.eslint_d,
      nls.builtins.diagnostics.golangci_lint, -- golangci_lint diagnostics
      nls.builtins.diagnostics.shellcheck,
      -- nls.builtins.diagnostics.markdownlint,  -- TODO
      nls.builtins.diagnostics.flake8,
      -- nls.builtins.diagnostics.vuels,

      -- nls.builtins.diagnostics.selene,
      -- nls.builtins.code_actions.gitsigns,
    },
    on_attach = options.on_attach,
    root_dir = require("null-ls.utils").root_pattern(".null-ls-root", ".nvim.settings.json", ".git"),
  })
end

function M.has_formatter(ft)
  local sources = require("null-ls.sources")
  local available = sources.get_available(ft, "NULL_LS_FORMATTING")
  return #available > 0
end

return M
