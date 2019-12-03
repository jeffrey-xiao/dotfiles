if exists('g:loaded_tabline')
  finish
endif
let g:loaded_tabline = 1

" Autocommands.
augroup tabline_group
  autocmd!
  autocmd VimEnter,TabEnter,BufAdd,BufDelete * call tabline#update()
augroup end
