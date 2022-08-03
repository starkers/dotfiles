local status_ok, which_key = pcall(require, "which-key")

-- TODO: the rest of this script won't work if which-key isn't installed..
-- probably really not important really, likely to just be the first run
if not status_ok then
	return
end

local opts = {
	buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
	mode = "n", -- NORMAL mode
	noremap = true, -- use `noremap` when creating keymaps
	nowait = true, -- use `nowait` when creating keymaps
	prefix = "<leader>",
	silent = true, -- use `silent` when creating keymaps
}

vim.cmd([[
  function! ToggleGitSigns()
    if(&signcolumn == "yes")
      set signcolumn=no
      Gitsigns toggle_signs<cr>
    else
      set signcolumn=yes
      Gitsigns toggle_signs<cr>
    endif
  endfunction
]])

-- function that does a three-way toggle between:
-- - relative numbers
-- - numbers
-- - nonumbers
vim.cmd([[
  function! NumberToggle()
    if(&number == 1)
      if (&relativenumber == 1)
        set norelativenumber
        " echom "showing absolute line numbers"
      else
        set norelativenumber
        set nonu
        " echom "disabling line numbers"
      endif
    else
      " echom "enabling line-numbers"
      set relativenumber
      set number
    endif
  endfunction

  "" set the default
  set relativenumber
]])

vim.cmd([[
  "" TODO: maybe use this plugin instead?
  "" https://github.com/ntpeters/vim-better-whitespace
  function! TrimWhitespace()
      let l:save = winsaveview()
      %s/\s\+$//e
      call winrestview(l:save)
  endfun
]])

-- A true classic, always returns you to the same location in a file as when you left it
vim.cmd([[
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
]])

local mappings = {
	["`"] = {
		name = "Ui Tweaks",
		n = { "<cmd>:call NumberToggle()<CR>", "numbers/relativenu/none" },
		g = { "<cmd>:call ToggleGitSigns()<CR>", "Git Signs" },
		i = { "<cmd>IndentBlanklineToggle<CR>", "indent blankline" },
	},
	["-"] = { "<cmd>:call TrimWhitespace()<CR>", "Trim whitespace" },
}

which_key.register(mappings, opts)
