" General config.
if filereadable('mix.exs')
  setlocal formatprg=mix\ format\ -
endif

" Keybindings.
nnoremap <buffer> <leader>e :!elixir %<CR>
