---@type ChadrcConfig
local M = {}

-- Path to overriding theme and highlights files
local highlights = require "custom.highlights"

M.ui = {
  -- theme = "oxocarbon",
  -- theme = "ayu_dark",
  theme = "oxocarbon",
  theme_toggle = { "oxocarbon", "one_light" },

  hl_override = highlights.override,
  hl_add = highlights.add,
}

-- M.plugins = "custom.plugins"

-- check core.mappings for table structure
-- M.mappings = require "custom.mappings"

-- M.nvimtree = {
--     git = {
--         enable = true,
--     },
--     renderer = {
--         highlight_git = true,
--         icons = {
--         show = {
--             git = true,
--             },
--         },
--     },
--     view = {
--         side = "right",
--     },
-- }

return M
