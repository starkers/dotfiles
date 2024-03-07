-- This function is run last and is a good place to configuring
-- augroups/autocommands and custom filetypes also this just pure lua so
-- anything that doesn't fit in the normal config locations above can go here
-- EG: https://github.com/datamonsterr/astronvim_config/blob/main/polish.lua
return function()
  local cmd = vim.cmd
  cmd "au TextYankPost * lua vim.highlight.on_yank {}"
  cmd "vnoremap < <gv"
  cmd "vnoremap > >gv"

  -- -- don't care for clipboard its startup time is +700ms
  -- cmd "let g:loaded_clipboard_provider = 1"

  -- Set up custom filetypes
  vim.filetype.add {
    extension = {
      star = "python", -- pretend starlark is python I guess
    },
    -- filename = {
    -- 	["Foofile"] = "fooscript",
    -- },
    -- pattern = {
    -- 	["~/%.config/foo/.*"] = "fooscript",
    -- },
  }

  -- vim.api.nvim_create_autocmd("BufNewFile,BufRead", {
  -- 	-- group = "filetypes",
  -- 	pattern = "*.py",
  -- 	command = ":set expandtab tabstop=4 softtabstop=4 shiftwidth=4",
  -- })

  -- cmd([[
  -- 		function! CustomGoFmt()
  --   		let file = expand('%')
  --   		silent execute "!gofmt -w " . file
  --   		silent execute "!goimports -w " . file
  --   		" silent execute "!golang-lint run --fix=false " . file
  --   		edit!
  -- 		endfunction
  -- 		command! CustomGoFmt call CustomGoFmt()
  -- 		augroup go_autocmd
  --   		autocmd BufWritePost *.go CustomGoFmt
  -- 		augroup END
  -- ]])
end
