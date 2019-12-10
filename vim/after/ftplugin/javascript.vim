" General config.
setlocal omnifunc=tern#Complete
if executable('prettier')
  setlocal formatprg=prettier\ --write\ --parser=flow
endif

" Functions.
function! RunJavaScript() abort
  execute '!node %'
endfunction

" Keybindings.
nnoremap gd :TernDef<CR>
nnoremap <buffer> <leader>e :call RunJavaScript()<CR>
