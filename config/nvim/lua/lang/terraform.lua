vim.filetype.add({
  extension = {
    tofu     = "opentofu",
    opentofu = "opentofu",
    hcl      = "terraform",
  },
})

-- Reuse the terraform treesitter parser for .opentofu files
vim.treesitter.language.register("terraform", "opentofu")

return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        terraformls = {
          filetypes = { "terraform", "terraform-vars", "opentofu" },
        },
      },
    },
  },
  {
    "stevearc/conform.nvim",
    optional = true,
    opts = {
      formatters_by_ft = {
        ["hcl"]           = { "terragrunt_hclfmt", "terraform_fmt" },
        ["terraform"]     = { "terraform_fmt" },
        ["terraform-vars"] = { "terraform_fmt" },
        ["opentofu"]      = { "tofu_fmt" },
      },
      formatters = {
        terraform_fmt = {
          command = "tofu",
          args = { "fmt", "-" },
          stdin = true,
        },
        tofu_fmt = {
          command = "tofu",
          args = { "fmt", "-" },
          stdin = true,
        },
      },
    },
  },
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      vim.list_extend(opts.ensure_installed, { "hcl", "terraform" })
    end,
  },
}
