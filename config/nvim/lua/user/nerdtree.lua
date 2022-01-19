vim.cmd([[

  " NERDTree, i like it to auto cd into the dir of my file
  set autochdir
  let NERDTreeChDirMode=2

  let NERDTreeWinPos="right"

  "" default {'file': {'reuse': 'all', 'where': 'p'}, 'dir': {}}
  let NERDTreeCustomOpenArgs={'file': {'reuse': 'all', 'where': 'o'}, 'dir': {}}
  " let NERDTreeCustomOpenArgs={'file': {'reuse': 'currenttab', 'where': 't'}, 'dir': {}}

  " let NERDTreeMapOpenInTab

]])
