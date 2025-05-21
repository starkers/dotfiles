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

-- -- comment+terminal keybind changes
-- -- I prefer Control+/ to be reserved for comment toggles
-- vim.keymap.del("t", "<c-_>")
-- vim.keymap.del("n", "<c-_>")

-- ctrl+l is a standard shortcut to clear a terminal.. please ignore it in terminal windows
-- in fact scrap all the "hjkl" ones.. I'm not gonna use em
local Util = require("lazyvim.util")
local lazyterm = function()
  Util.terminal(nil, { cwd = Util.root() })
end

vim.keymap.del("n", "<c-_>")
vim.keymap.del("t", "<c-_>")
local lineWise = function()
  require("Comment.api").toggle.linewise.current()
end
vim.keymap.set("n", "<c-_>", lineWise, { desc = "Comment linewise" })
vim.keymap.set("t", "<c-_>", lineWise, { desc = "Comment linewise" })
vim.keymap.set("v", "<c-_>", lineWise, { desc = "Comment linewise" })

vim.keymap.set("n", "<c-\\>", lazyterm, { desc = "Terminal (root dir)" })
-- vim.keymap.set("n", "<c-\\>", lazyterm, { desc = "Terminal (root dir)" })

vim.keymap.set("n", "<F5>", lazyterm, { desc = "Terminal (root dir)" })
vim.keymap.set("t", "<F5>", "<cmd>close<cr>", { desc = "Hide Terminal" })

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
