if exists('g:loaded_statusline')
  finish
endif
let g:loaded_statusline = 1

" Autocommands.
set statusline=%!statusline#Statusline()
augroup statusline_group
  autocmd!
  autocmd cursorhold,bufwritepost * unlet! b:warning_flags
augroup end
