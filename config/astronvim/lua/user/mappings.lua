-- Mapping data with "desc" stored directly by vim.keymap.set(). Please use this mappings table to set keyboard mapping since this is the
-- lower level configuration and more robust one. (which-key will
-- automatically pick-up stored data by this setting.)
local macro = require "user.util.macro"
local buffer = require "astronvim.utils.buffer"

return {
  -- first key is the mode
  n = {
    -- comment like every other gdamn editor.. Ctrl+/
    -- TODO: how to make this "." repeatable?
    ["<C-_>"] = {
      function() require("Comment.api").toggle.linewise.current() end,
      desc = "Comment line",
    },

    -- TODO: "align" keymaps in its own config file?
    ["gaa"] = {
      desc = "Align by character",
      function()
        local a = require "align"
        a.operator(a.align_to_char, { length = 1, reverse = true })
      end,
    },
    ["gaw"] = {
      desc = "Align by string",
      function()
        local a = require "align"
        a.operator(a.align_to_string, { is_pattern = false, reverse = true, preview = true })
      end,
    },
    ["<S-l>"] = {
      function() buffer.nav(vim.v.count > 0 and vim.v.count or 1) end,
      desc = "Next buffer",
    },
    ["<S-h>"] = {
      function() buffer.nav(-(vim.v.count > 0 and vim.v.count or 1)) end,
      desc = "Previous buffer",
    },

    ["n"] = { macro.better_search "n", desc = "Next search with center and unfold" },
    ["N"] = { macro.better_search "N", desc = "previous search with center and unfold" },
    -- basic buffer/tab movement (as I prefer)
    ["<C-n>"] = { "<cmd>tabnew<cr>", desc = "New tab" },
    ["<C-Left>"] = { ":bprevious<cr>", desc = "switch buffers using Ctrl+arrow" },
    ["<C-Right>"] = { ":bnext<cr>", desc = "switch buffers using Ctrl+arrow" },

    -- Move to window using arrows
    ["<left>"] = { "<C-w>h", desc = "move to window using just arrows" },
    ["<down>"] = { "<C-w>j", desc = "move to window using just arrows" },
    ["<up>"] = { "<C-w>k", desc = "move to window using just arrows" },
    ["<right>"] = { "<C-w>l", desc = "move to window using just arrows" },

    -- Resize win                                dow using <ctrl> arrow keys
    ["<S-Up>"] = { ":resize +2<CR>", desc = "resize using Shift+arrow" },
    ["<S-Down>"] = { ":resize -2<CR>", desc = "resize using Shift+arrow" },
    ["<S-Left>"] = { ":vertical resize -2<CR>", desc = "resize using Shift+arrow" },
    ["<S-Right>"] = { ":vertical resize +2<CR>", desc = "resize using Shift+arrow" },

    -- second key is the prefix, <leader> prefixes
    ["<leader>"] = {

      -- I don't like the default Neotree bind.. always wanna see files in the path
      -- adding reveal_force
      -- https://github.com/AstroNvim/AstroNvim/blob/34208f8fed7521380930cea3ec4f65f993fe22d2/lua/astronvim/mappings.lua#L168
      ["e"] = { "<cmd>Neotree toggle reveal_force_cwd<cr>", "Toggle Explorer" },
      -- third key is the key to bring up next level and its displayed
      -- group name in which-key top level menu
      ["b"] = {
        name = "Buffer",
        ["b"] = { "<cmd>:Telescope buffers<CR>", "Browse buffers (Telescope)" },
        ["D"] = { "<cmd>:bd<CR>", "Delete Buffer & Window" },
        ["["] = { "<cmd>:BufferLineCyclePrev<CR>", "Previous Buffer" },
        ["]"] = { "<cmd>:BufferLineCycleNext<CR>", "Next Buffer" },
        -- ["b"] = { "<cmd>:e #<cr>", "Switch to Other Buffer" },
        ["d"] = { "<cmd>:BDelete this<CR>", "Delete Buffer" },
        ["g"] = { "<cmd>:BufferLinePick<CR>", "Goto Buffer" },
        ["n"] = { "<cmd>:BufferLineCycleNext<CR>", "Next Buffer" },
        ["p"] = { "<cmd>:BufferLineCyclePrev<CR>", "Previous Buffer" },
        -- ["y"] = { "<cmd>:%!yamlfmt<CR>", "yaml fmt" },
      },
      ["v"] = {
        name = "Vim",
        ["c"] = { "<cmd>:edit ~/.config/astronvim/lua/user/<CR>", "Config" },
      },
      ["T"] = { "<cmd>TroubleToggle<cr>", "TroubleToggle" },
      ["-"] = { "<cmd>:%!yamlfmt<CR>", "Yaml fmt" },
    },
  },
  -- t = {
  -- 	-- setting a mapping to false will disable it
  -- 	-- ["<esc>"] = false,
  -- },
}
