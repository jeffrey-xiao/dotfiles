" Functions
function! RunElixir() abort
  execute '!elixir %'
endfunction

" Keybindings
nnoremap <buffer> <F5> :call RunElixir()<CR>
