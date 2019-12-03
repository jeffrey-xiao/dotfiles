if exists('g:loaded_statusline')
  finish
endif
let g:loaded_statusline = 1

" Autocommands.
augroup statusline_group
  autocmd!
  autocmd cursorhold,bufwritepost * unlet! b:warning_flags
  autocmd VimEnter,WinEnter,BufWinEnter * call statusline#update()
augroup end
