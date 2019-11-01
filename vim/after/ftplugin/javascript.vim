" General config.
setlocal omnifunc=tern#Complete

" Functions.
function! RunJavaScript() abort
  execute '!node %'
endfunction

" Keybindings.
nmap gd :TernDef<CR>
nnoremap <buffer> <leader>e :call RunJavaScript()<CR>
