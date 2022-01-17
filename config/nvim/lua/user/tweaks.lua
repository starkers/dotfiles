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
  "leader n for number toggle is easier to recall than
  nnoremap <leader>` :call NumberToggle()<cr>


  
  "" TODO: maybe use this plugin instead?
  "" https://github.com/ntpeters/vim-better-whitespace
  function! TrimWhitespace()
      let l:save = winsaveview()
      %s/\s\+$//e
      call winrestview(l:save)
  endfun
  nnoremap <leader>- :call TrimWhitespace()<cr>


]])

-- A true classic, always returns you to the same location in a file as when you left it
vim.cmd([[
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
]])

-- -- Highlight on yank
-- vim.cmd([[
--   augroup YankHighlight
--     autocmd!
--     autocmd TextYankPost * silent! lua vim.highlight.on_yank()
--   augroup end
-- ]])
