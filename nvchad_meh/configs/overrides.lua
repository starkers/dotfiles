local M = {}

M.treesitter = {
  ensure_installed = {
    "bash",
    "c",
    "css",
    "fish",
    "go",
    "html",
    "javascript",
    "json",
    "jsonc",
    "lua",
    "make",
    "markdown",
    "markdown_inline",
    "python",
    "templ",
    "terraform",
    "toml",
    "tsx",
    "typescript",
    "vim",
    "yaml",
  },
  indent = {
    enable = true,
    -- disable = {
    --   "python"
    -- },
  },
}

M.mason = {
  ensure_installed = {
    -- lua stuff
    "lua-language-server",
    "stylua",

    -- pretty much everything
    "yaml-language-server",

    -- Terraform/Terragrunt
    "hclfmt",
    "terraform-ls",

    -- web dev stuff
    "css-lsp",
    "html-lsp",
    "htmx-lsp",
    "typescript-language-server",
    "tailwindcss-language-server",
    "deno",
    "prettier",

    -- -- Go
    "gofumpt",
    "gopls",
    "goimports-reviser",
    "golines",
    "golangci-lint-langserver",
    "templ",

    -- -- python
    "black",
    "pyright",

    -- -- c/cpp stuff
    -- "clangd",
    -- "clang-format",

    -- MISC
    "shfmt",
    "markdownlint",
    "kcl",
  },
}

-- git support in nvimtree
M.nvimtree = {
  git = {
    enable = true,
  },

  renderer = {
    highlight_git = true,
    icons = {
      show = {
        git = true,
      },
    },
  },
}

return M
