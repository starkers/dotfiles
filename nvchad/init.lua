-- This file gets called "raw" when the chadrc gets sourced..


-- local autocmd = vim.api.nvim_create_autocmd
-- Auto resize panes when resizing nvim window
-- autocmd("VimResized", {
--   pattern = "*",
--   command = "tabdo wincmd =",
-- })

-- register misc filetypes
vim.filetype.add {
  extension = { templ = "templ" },
}
