-- See: https://github.com/numToStr/Comment.nvim
-- TODO: possible to map Comment.api to be repeatable via '.' ?
return {
  "numToStr/Comment.nvim",
  -- opts = {
  --   --   -- add any options here
  -- },
  lazy = false,
  keys = {
    {
      "<C-/>",
      function()
        require("Comment.api").toggle.linewise.current()
      end,
      desc = "Comment linewise",
    },
  },
}
