-- you can use the function()...end notation
-- options = function(local_vim)
--   local_vim.opt.relativenumber = true
--   local_vim.g.mapleader = " "
--   local_vim.opt.whichwrap = vim.opt.whichwrap - { 'b', 's' } -- removing option from list
--   local_vim.opt.shortmess = vim.opt.shortmess + { I = true } -- add to option list
--
--   return local_vim
-- end,

return {
  opt = {
    -- set to true or false etc.
    mouse = "a",
    -- mouse = "",
    -- TODO: bind something to explicitly yank to clipboard mayhapse
    clipboard = "unnamedplus",
    wrap = true, -- sets vim.opt.wrap
    list = true, -- show whitespace characters
    foldcolumn = "0",
    shell = "fish",

    listchars = {
      tab = "  ",
      -- tab = " ",
      -- extends = "⟩",
      -- precedes = "⟨",
      trail = "·",
      -- nbsp = "+",
      -- eol = "﬋",
    },

    -- TODO: what is this in neovim? maybe gpaste or similar awareness?
    -- loaded_clipboard_provider = false,
  },
  g = {
    --     -- mapleader = " ", -- sets vim.g.mapleader
    --     -- autoformat_enabled = true, -- enable or disable auto formatting at start (lsp.formatting.format_on_save must be enabled)
    --     -- cmp_enabled = true, -- enable completion at start
    autopairs_enabled = false, -- enable autopairs at start
    --     -- diagnostics_enabled = true, -- enable diagnostics at start
    --     -- status_diagnostics_enabled = true, -- enable diagnostics in statusline
    --     -- icons_enabled = true, -- disable icons in the UI (disable if no nerd font is available, requires :PackerSync after changing)
  },
}
