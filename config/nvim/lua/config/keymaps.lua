-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- I prefer resizing with Shift
vim.keymap.del("n", "<c-Up>")
vim.keymap.del("n", "<c-Down>")
vim.keymap.del("n", "<c-Left>")
vim.keymap.del("n", "<c-Right>")
vim.keymap.set("n", "<s-Up>", "<cmd>resize +2<cr>", { desc = "Increase window height" })
vim.keymap.set("n", "<s-Down>", "<cmd>resize -2<cr>", { desc = "Decrease window height" })
vim.keymap.set("n", "<s-Left>", "<cmd>vertical resize -2<cr>", { desc = "Decrease window width" })
vim.keymap.set("n", "<s-Right>", "<cmd>vertical resize +2<cr>", { desc = "Increase window width" })

-- buffers
vim.keymap.del("n", "<s-h>")
vim.keymap.del("n", "<s-l>")
vim.keymap.set("n", "<c-Left>", "<cmd>bprevious<cr>", { desc = "Prev buffer" })
vim.keymap.set("n", "<c-Right>", "<cmd>bnext<cr>", { desc = "Next buffer" })

-- ctrl+l is a standard shortcut to clear a terminal.. please ignore it in terminal windows
-- in fact scrap all the "hjkl" ones.. just use toggle
vim.keymap.del("t", "<c-h>")
vim.keymap.del("t", "<c-j>")
vim.keymap.del("t", "<c-k>")
vim.keymap.del("t", "<c-l>")
vim.keymap.del("t", "<c-_>")

local Util = require("lazyvim.util")
local lazyterm = function()
  Util.terminal(nil, { cwd = Util.root() })
end
vim.keymap.set("n", "<c-#>", lazyterm, { desc = "Terminal (root dir)" })
vim.keymap.set("t", "<c-#>", "<cmd>close<cr>", { desc = "Hide Terminal" })

-- vim.keymap.del("n", "<C-h>")
-- vim.keymap.del("n", "<C-j>")
-- vim.keymap.del("n", "<C-k>")
-- vim.keymap.del("n", "<C-l>")
-- vim.keymap.del("n", "<S-h>")
-- vim.keymap.del("n", "<S-l>")

-- vim.keymap.set("n", "<S-Left>", )
-- -- Move to window using the <ctrl> hjkl keys
-- map("n", "<C-h>", "<C-w>h", { desc = "Go to left window", remap = true })
-- map("n", "<C-j>", "<C-w>j", { desc = "Go to lower window", remap = true })
-- map("n", "<C-k>", "<C-w>k", { desc = "Go to upper window", remap = true })
-- map("n", "<C-l>", "<C-w>l", { desc = "Go to right window", remap = true })
