" General config.
if executable('prettier')
  setlocal formatprg=prettier\ --write\ --parser=flow
endif

" Keybindings.
nnoremap <buffer> <leader>e :!node %<CR>
