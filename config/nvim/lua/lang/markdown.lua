return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      vim.list_extend(opts.ensure_installed, { "markdown", "markdown_inline", "mermaid" })
    end,
  },
  {
    "mfussenegger/nvim-lint",
    opts = function()
      -- markdownlint-cli2 stops config discovery at git repo boundaries, so it never
      -- finds ~/.markdownlint.jsonc when linting files inside other repos. Forcing cwd
      -- to ~ means discovery always starts from home and finds the global config.
      -- TODO: validate this still respects .markdownlint.json files inside a git repo
      require("lint").linters["markdownlint-cli2"].cwd = vim.fn.expand("~")
    end,
  },
}
