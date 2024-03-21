-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
vim.filetype.add({

  extension = {
    star = "python", -- pretend starlark is python I guess
    hcl = "terraform", -- meh.. maybe its terraform?
    templ = "templ",
  },
  -- filename = {
  -- 	["Foofile"] = "fooscript",
  -- },
  -- pattern = {
  -- 	["~/%.config/foo/.*"] = "fooscript",
  -- },
})
