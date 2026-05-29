return {
  {
    "rebelot/kanagawa.nvim",
    opts = {
      theme = "wave", -- wave, dragon, lotus
      transparent = true,
    },
  },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "kanagawa",
    },
  },
  {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",
    opts = function(_, opts)
      table.insert(opts.sections.lualine_x, "😄")
    end,
  },
}
