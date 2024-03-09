local M = {}

M.treesitter = {
  ensure_installed = {
    "vim",
    "lua",
    "html",
    "css",
    "javascript",
    "typescript",
    "tsx",
    "c",
    "markdown",
    "markdown_inline",
    "go",
    "gomod",
    "gosum",
    "make",
    "templ",
    "yaml",
    "fish",
    "bash",
    "python",
    "json",
    "jsonc",
    "jsonnet",
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

    -- web dev stuff
    "css-lsp",
    "html-lsp",
    "typescript-language-server",
    "deno",
    "prettier",
    "htmx-lsp",

    -- c/cpp stuff
    "clangd",
    "clang-format",

    -- shell stuff
    "shfmt",

    -- go
    "golines",
    "gofumpt",
    "golangci-lint-langserver",
    "goimports",
    "gotests",
    "gopls",

    -- py
    "black",
    "pyright",

    -- misc
    "terraform-ls",
    "yaml-language-server",
    "yamlfmt",
    "yamlfix",
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
