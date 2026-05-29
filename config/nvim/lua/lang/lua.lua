return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      vim.list_extend(opts.ensure_installed, {
        "lua",
        "query", -- "query" is the treesitter query language (.scm files), used in lua/nvim dev
      })
    end,
  },
}
