-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua

-- Keep custom spell words in dotfiles so they're git-tracked
vim.opt.spellfile = vim.fn.stdpath("config") .. "/spell/en.utf-8.add"
