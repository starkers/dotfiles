# Neovim Config

Built on [LazyVim](https://lazyvim.github.io). See the [LazyVim docs](https://lazyvim.github.io/installation) for the full reference.

---

## Where to find things

```
lua/
  config/
    keymaps.lua       — custom key bindings (window resize, buffer nav, terminal, comments)
    options.lua       — editor options (spellfile, etc.)
    autocmds.lua      — autocommands
  plugins/
    appearance.lua    — colorscheme (kanagawa) + statusline (lualine)
    claude.lua        — Claude Code integration
    completion.lua    — completion sources (cmp-emoji)
    markdown.lua      — markdownlint linter config
    snacks.lua        — terminal tweaks
    telescope.lua     — telescope keymaps
  lang/
    bash.lua          — Bash + Fish treesitter
    go.lua            — Go: LSP (gopls) + treesitter
    lua.lua           — Lua + treesitter query language
    markdown.lua      — Markdown treesitter parsers
    python.lua        — Python: LSP (pyright) + treesitter
    starlark.lua      — .star filetype detection
    terraform.lua     — Terraform/OpenTofu: LSP + formatters + filetype detection
    typescript.lua    — TypeScript/JS/JSON: LSP + treesitter
    yaml.lua          — YAML treesitter
    ...               — one file per language
```

To add config for a language, find or create its file in `lua/lang/`.

---

## Handy commands

### Plugin management

| Command | What it does |
|---------|-------------|
| `:Lazy` | Open plugin manager — update, install, profile |
| `:Lazy sync` | Update all plugins |
| `:Mason` | Manage LSP servers, linters, formatters |
| `:MasonInstall <name>` | Install a specific tool |

### LSP

| Command | What it does |
|---------|-------------|
| `<leader>cl` | LSP info for current buffer |
| `K` | Hover docs |
| `gd` | Go to definition |
| `gr` | Go to references |
| `<leader>cr` | Rename symbol |
| `<leader>ca` | Code action |

### Commenting

`Ctrl+/` (or `Ctrl+_`) toggles comments on the current line in normal and visual mode.

For motion-based commenting use the `gc` operator:

| Command | What it does |
|---------|-------------|
| `Ctrl+/` | Toggle comment on current line |
| `Ctrl+/` (visual) | Toggle comment on selection |
| `gcip` | Toggle comment on inner paragraph |
| `gcap` | Toggle comment on a paragraph (including blank line) |
| `gc5j` | Toggle comment on next 5 lines |
| `gcG` | Toggle comment from here to end of file |
| `gcc` | Toggle comment on current line (vim motion style) |

`gc` works with any motion or text object — treat it like `d` or `y`.

### Diagnostics & linting

| Command | What it does |
|---------|-------------|
| `<leader>ud` | Toggle diagnostics on/off |
| `<leader>xx` | Open diagnostics panel (Trouble) |
| `]d` / `[d` | Jump to next/prev diagnostic |
| `:lua vim.diagnostic.open_float()` | Show diagnostic detail under cursor |

### Spelling

| Command | What it does |
|---------|-------------|
| `zg` | Add word under cursor to personal dictionary |
| `zw` | Mark word as wrong |
| `z=` | Show spelling suggestions for word under cursor |
| `<leader>us` | Toggle spell checking |

Personal dictionary lives in `spell/en.utf-8.add` — edit it directly to bulk-add words (e.g. CUDA, vLLM, MCP).

### Appearance

| Command | What it does |
|---------|-------------|
| `<leader>uL` | Toggle relative line numbers |
| `<leader>ul` | Toggle line numbers |
| `<leader>uw` | Toggle word wrap |
| `<leader>uh` | Toggle inlay hints |

### Terminal

| Key | What it does |
|-----|-------------|
| `F5` | Toggle terminal (project root) |
| `F5` (in terminal) | Hide terminal |

### Treesitter

| Command | What it does |
|---------|-------------|
| `:TSInstall <lang>` | Install a treesitter parser |
| `:TSUpdate` | Update all parsers |
| `:InspectTree` | Show treesitter parse tree for current buffer |

---

## Adding a new language

**Find available tools here:**

- LSP servers — [nvim-lspconfig server list](https://github.com/neovim/nvim-lspconfig/blob/master/doc/configs.md)
- Mason packages (LSPs, linters, formatters) — [mason-registry](https://mason-registry.dev/registry/list)
- Treesitter parsers — [nvim-treesitter supported languages](https://github.com/nvim-treesitter/nvim-treesitter#supported-languages)
- Conform formatters — [conform.nvim formatter list](https://github.com/stevearc/conform.nvim#formatters)
- nvim-lint linters — [nvim-lint linter list](https://github.com/mfussenegger/nvim-lint#available-linters)

**Steps:**

1. Create `lua/lang/<language>.lua`
2. Add LSP server via `nvim-lspconfig` opts
3. Add treesitter parsers via `nvim-treesitter` opts
4. Add formatter via `conform.nvim` opts
5. Add filetype detection at the top of the file if needed

Example skeleton:

```lua
vim.filetype.add({ extension = { ext = "filetype" } })

return {
  {
    "neovim/nvim-lspconfig",
    opts = { servers = { myls = {} } },
  },
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      vim.list_extend(opts.ensure_installed, { "mylang" })
    end,
  },
}
```
