local status_ok, _ = pcall(require, "lspconfig")
if not status_ok then
  return
end

require("user.lsp.lsp-installer")
require("user.lsp.handlers").setup()
require("user.lsp.null-ls")


-- function _G.toggle_diagnostics()
--   if vim.g.diagnostics_visible then
--     vim.g.diagnostics_visible = false
--     vim.diagnostic.enable()
--   else
--     vim.g.diagnostics_visible = true
--     vim.diagnostic.enable()
--   end
-- end
--
-- vim.api.nvim_buf_set_keymap(0, 'n', '<Leader>d', ':call v:lua.toggle_diagnostics()<CR>', { silent = true, noremap = true })
