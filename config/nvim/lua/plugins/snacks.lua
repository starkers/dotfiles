-- Remove snacks terminal's window-local <c-_> and <c-/> bindings so they
-- don't shadow the global Comment.nvim mappings when inside a terminal buffer.
return {
  "snacks.nvim",
  opts = {
    terminal = {
      win = {
        keys = {
          hide_slash = false,
          hide_underscore = false,
        },
      },
    },
  },
}
