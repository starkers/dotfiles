local util = require("util")

local M = {}

-- vim.lsp.handlers["textDocument/hover"] = function(_, method, result)
--   print(vim.inspect(result))
-- end

M.autoformat = true

function M.toggle()
  M.autoformat = not M.autoformat
  if M.autoformat then
    util.info("enabled format on save", "Formatting")
  else
    util.warn("disabled format on save", "Formatting")
  end
end

function M.format()
  if M.autoformat then
    vim.lsp.buf.format({
      timeout_ms = 2000, -- TODO: had to make this longer for vue.. debug me
      -- async = true
    })
    -- util.info("ran: vim.lsp.buf.format()", "Formatting")
  end
end

function M.setup(client, buf)
  local ft = vim.api.nvim_buf_get_option(buf, "filetype")
  local nls = require("config.lsp.null-ls")

  local enable = false
  if nls.has_formatter(ft) then
    -- util.info("null-ls formatter called", "Formatting")
    enable = client.name == "null-ls"
  else
    -- util.info("not using null-ls", "Formatting")
    enable = not (client.name == "null-ls")
  end

  client.server_capabilities.documentFormatting = enable
  -- format on save
  if client.server_capabilities.documentFormatting then
    vim.cmd([[
      augroup LspFormat
        autocmd! * <buffer>
        autocmd BufWritePre <buffer> lua require("config.lsp.formatting").format()
      augroup END
    ]])
  end
end

return M
