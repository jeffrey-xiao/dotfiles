" General config.
setlocal omnifunc=tern#Complete
if executable('prettier')
  setlocal formatprg=prettier\ --write\ --parser=flow
endif

" Keybindings.
nnoremap <buffer> <leader>e :!node %<CR>
