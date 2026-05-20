return {
  -- generic formatter for nvim
  -- https://github.com/stevearc/conform.nvim
  "stevearc/conform.nvim",
  optional = true,
  opts = {

    formatters_by_ft = {
      -- See: https://github.com/stevearc/conform.nvim?tab=readme-ov-file#formatters
      ["hcl"] = { "terragrunt_hclfmt", "terraform_fmt" },
      ["terraform"] = { "tofu_fmt", "terraform_fmt" },
      ["terraform-vars"] = { "tofu_fmt", "terraform_fmt" },
      ["yaml"] = { "yamlfmt" },
    },

    formatters = {
      hclfmt = {
        command = "hclfmt",
      },
      tofu_fmt = {
        command = "tofu",
        args = { "fmt", "-" },
        stdin = true,
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
