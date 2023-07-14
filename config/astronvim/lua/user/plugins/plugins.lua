return {
  ------ disabled ---------
  { "goolord/alpha-nvim",      enabled = false },
  { "Darazaki/indent-o-matic", enabled = false },

  ------- added -------
  {
    "onsails/lspkind.nvim",
    opts = function(_, opts)
      -- use codicons preset
      opts.preset = "codicons"
      -- set some missing symbol types
      opts.symbol_map = {
        Array = "",
        Boolean = "",
        Key = "",
        Namespace = "",
        Null = "",
        Number = "",
        Object = "",
        Package = "",
        String = "",
      }
      return opts
    end,
  },
  { "Glench/Vim-Jinja2-Syntax" },
  { "lukoshkin/trailing-whitespace" },
  { "Vimjas/vim-python-pep8-indent" },

  { "folke/tokyonight.nvim" },
  { "folke/trouble.nvim",           cmd = "TroubleToggle" },
  {
    "folke/todo-comments.nvim",
    event = "User AstroFile",
    config = true,
  },                 -- TODO: stuff

  { "dag/vim-fish" }, -- basic fish syntax awareness
  { "isobit/vim-caddyfile" },

  {
    "ethanholz/nvim-lastplace",
    event = "BufRead",
    config = function()
      require("nvim-lastplace").setup({
        lastplace_ignore_buftype = { "quickfix", "nofile", "help" },
        lastplace_ignore_filetype = {
          "gitcommit",
          "gitrebase",
          "svn",
          "hgcommit",
        },
        lastplace_open_folds = true,
      })
    end,
  },
}
