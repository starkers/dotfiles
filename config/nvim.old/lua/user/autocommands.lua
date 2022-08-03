vim.cmd([[

  augroup _general_settings
    autocmd!
    autocmd FileType qf,help,man,lspinfo nnoremap <silent> <buffer> q :close<CR> 
    autocmd TextYankPost * silent!lua require('vim.highlight').on_yank({higroup = 'Visual', timeout = 200}) 
    autocmd BufWinEnter * :set formatoptions-=cro
    autocmd FileType qf set nobuflisted
  augroup end

  augroup _git
    autocmd!
    autocmd FileType gitcommit setlocal wrap
    autocmd FileType gitcommit setlocal spell
  augroup end

  augroup _markdown
    autocmd!
    autocmd FileType markdown setlocal wrap
    autocmd FileType markdown setlocal spell
  augroup end

  augroup _auto_resize
    autocmd!
    autocmd VimResized * tabdo wincmd = 
  augroup end

  augroup _alpha
    autocmd!
    autocmd User AlphaReady set showtabline=0 | autocmd BufUnload <buffer> set showtabline=2
  augroup end

  augroup LspFormatting
      autocmd! * <buffer>
      autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()
  augroup END
  " augroup _lsp
  "   autocmd!
  "   autocmd BufWritePre * lua vim.lsp.buf.formatting()
  "   autocmd BufWritePre * go vim.lsp.buf.formatting()
  "   autocmd BufWritePre * python vim.lsp.buf.formatting()
  " augroup end
]])

-- highlight what u yank
vim.cmd([[
  augroup YankHighlight
    autocmd!
    autocmd TextYankPost * silent! lua vim.highlight.on_yank()
  augroup end
]])

-- A true classic, always returns you to the same location in a file as when you left it
vim.cmd([[
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
]])

-- GOLANG

vim.cmd([[

  function! CustomGoFmt()
    let file = expand('%')
    silent execute "!gofmt -w " . file
    silent execute "!goimports -w " . file
    " silent execute "!golang-lint run --fix=false " . file
    edit!
  endfunction

  command! CustomGoFmt call CustomGoFmt()
  augroup go_autocmd
    autocmd BufWritePost *.go CustomGoFmt
  augroup END

]])
