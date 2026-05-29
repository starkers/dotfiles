return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      -- regex: embedded regex highlighting used across many languages
      vim.list_extend(opts.ensure_installed, { "regex" })
    end,
  },
}
