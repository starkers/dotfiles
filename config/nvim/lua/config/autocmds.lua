-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

vim.filetype.add({
  extension = {
    tofu = "opentofu",
    opentofu = "opentofu",
  },
})

-- Reuse the terraform treesitter parser for .opentofu files
vim.treesitter.language.register("terraform", "opentofu")
