" General config.
if executable('mix')
  setlocal formatprg=mix\ format\ -
endif

" Functions.
function! RunElixir() abort
  execute '!elixir %'
endfunction

" Keybindings.
nnoremap <buffer> <leader>e :call RunElixir()<CR>
