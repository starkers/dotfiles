vim.filetype.add({
  extension = {
    templ = "templ",
  },
})

return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        templ = {},
      },
    },
  },
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      vim.list_extend(opts.ensure_installed, { "templ" })
    end,
  },
}
