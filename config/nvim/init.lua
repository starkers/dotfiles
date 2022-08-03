require("user.options")
require("user.keymaps")
require("user.plugins")
require("user.colorscheme")
require("user.cmp")
require("user.lsp")
require("user.telescope")
require("user.treesitter")
require("user.autopairs")
require("user.comment")
require("user.gitsigns")
require("user.sidebar")
require("user.nerdtree")
require("user.bufferline")
require("user.lualine")
require("user.toggleterm")
require("user.project")
require("user.impatient")
require("user.indentline")
require("user.alpha")
require("user.whichkey")

require("user.tweaks")

require("user.autocommands")


-- _G.open_telescope = function()
--     local first_arg = vim.v.argv[2]
--     if first_arg and vim.fn.isdirectory(first_arg) == 1 then
--         vim.g.loaded_netrw = true
--         require("telescope.builtin").find_files({search_dirs = {first_arg}})
--     end
-- end
-- vim.api.nvim_exec([[
-- augroup TelescopeOnEnter
--     autocmd!
--     autocmd VimEnter * lua open_telescope()
-- augroup END
-- ]], false)
