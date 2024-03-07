return {
  -- https://github.com/AstroNvim/astrocommunity/tree/main?tab=readme-ov-file#userpluginscommunitylua-example
  -- Add the community repository of plugin specifications
  "AstroNvim/astrocommunity",
  -- example of importing a plugin, comment out to use it or add your own
  -- available plugins can be found at https://github.com/AstroNvim/astrocommunity

  -- { import = "astrocommunity.colorscheme.catppuccin" },
  -- { import = "astrocommunity.completion.copilot-lua-cmp" },
  -- { import = "astrocommunity.colorscheme.nightfox-nvim", enabled = true },
  -- { import = "astrocommunity.colorscheme.kanagawa-nvim", enabled = true },
  -- { import = "astrocommunity.colorscheme.rose-pine" },
  -- { import = "astrocommunity.colorscheme.dracula" },
  { import = "astrocommunity.colorscheme.catppuccin", enabled = true },
  { -- further customize the options set by the community
    "catppuccin",
    opts = {
      -- https://github.com/catppuccin/nvim?tab=readme-ov-file#integrations
      integrations = {
        sandwich = false,
        noice = true,
        mini = true,
        leap = true,
        markdown = true,
        neotest = true,
        cmp = true,
        overseer = true,
        lsp_trouble = true,
        rainbow_delimiters = true,
      },
    },
  },
}
