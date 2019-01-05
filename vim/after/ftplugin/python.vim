"" General config
setlocal omnifunc=jedi#completions


"" Functions
function! RunPython() abort
  execute '!python %'
endfunction


"" Keybindings
nnoremap <buffer> <F5> :call RunPython()<CR>
