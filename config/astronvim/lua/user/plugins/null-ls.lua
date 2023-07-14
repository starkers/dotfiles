return {
  "jose-elias-alvarez/null-ls.nvim",
  opts = function(_, opts)
    local null_ls = require("null-ls")
    opts.sources = {

      null_ls.builtins.formatting.prettier,
      null_ls.builtins.formatting.isort,
      null_ls.builtins.formatting.goimports,
      null_ls.builtins.formatting.terraform_fmt,
      -- null_ls.builtins.formatting.clang_format,
      -- null_ls.builtins.formatting.rustfmt,

      -- null_ls.builtins.formatting.shfmt.with {
      --   args = { "-i", "2" },
      --
      -- },

      -- python
      null_ls.builtins.formatting.black,
      null_ls.builtins.diagnostics.flake8,
      -- null_ls.builtins.diagnostics.pylint,
      -- null_ls.builtins.diagnostics.mypy,

      -- lua
      null_ls.builtins.diagnostics.luacheck,
      null_ls.builtins.formatting.stylua,
    }
    return opts
  end,
}

-- return function(config) -- overrides `require("null-ls").setup(config)`
--   -- config variable is the default configuration table for the setup function call
--   local null_ls = require("null-ls")
--   -- Check supported formatters and linters
--   -- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/formatting
--   -- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/diagnostics
--   config.sources = {
--     -- Set a formatter
--     null_ls.builtins.formatting.goimports,
--     null_ls.builtins.formatting.stylua,
--     null_ls.builtins.formatting.terraform_fmt,
--     -- null_ls.builtins.formatting.prettier,
--   }
--   return config -- return final config table
-- end

-- return function(config)
--   -- https://github.com/jose-elias-alvarez/null-ls.nvim
--   local null_ls = require "null-ls"
--   local formatting = null_ls.builtins.formatting
--   config.sources = {
--     formatting.stylua,
--     formatting.black,
--     formatting.prettierd.with {
--       env = {
--         PRETTIERD_DEFAULT_CONFIG = vim.fn.expand "~/.config/.prettierrc.json",
--       },
--     },
--     formatting.shfmt,
--   }
--   config.on_attach = function(client)
--     if client.server_capabilities.documentFormattingProvider then
--       vim.api.nvim_create_augroup("format_on_save", { clear = true })
--       vim.api.nvim_create_autocmd("BufWritePre", {
--         desc = "Auto format before save",
--         group = "format_on_save",
--         pattern = "<buffer>",
--         callback = function()
--           vim.lsp.buf.formatting_sync { async = true }
--         end,
--       })
--     end
--   end
--   return config
-- end
