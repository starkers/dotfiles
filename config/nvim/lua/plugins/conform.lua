return {
  -- generic formatter for nvim
  -- https://github.com/stevearc/conform.nvim
  "stevearc/conform.nvim",
  optional = true,
  opts = {
    formatters_by_ft = {
      ["hcl"] = { "terragrunt_hclfmt", "terraform_fmt" },
      ["terraform"] = { "terraform_fmt" },
    },

    formatters = {
      hclfmt = {
        command = "hclfmt",
      },
    },

    -- formatters = {
    --   shfmt = {
    --     prepend_args = { "-i", "2", "-ci" },
    --   },
    --   dprint = {
    --     condition = function(self, ctx)
    --       return vim.fs.find({ "dprint.json" }, { path = ctx.filename, upward = true })[1]
    --     end,
    --   },
    -- },
  },
}
