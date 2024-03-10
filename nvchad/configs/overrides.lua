local M = {}

M.treesitter = {
  ensure_installed = {
    -- "autotools-language-server",
    "c",
    "css",
    "go",
    "gomod",
    "gosum",
    "html",
    "javascript",
    "lua",
    "make",
    "markdown",
    -- "marksman",
    "markdown_inline",
    "python",
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
  -- see: https://github.com/williamboman/mason-lspconfig.nvim?tab=readme-ov-file#available-lsp-servers
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
    "bash-language-server",

    -- go
    "gopls",
    "golangci-lint-langserver",
    "goimports-reviser",
    "golines",
    "gofumpt",
    "templ",

    -- py
    "pyright",
    "black",


    -- misc
    "autotools-language-server", -- make
    "taplo", -- toml
    "terraform-ls",
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
