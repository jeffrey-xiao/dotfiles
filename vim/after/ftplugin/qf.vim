" General config.
setlocal number
setlocal norelativenumber
setlocal nobuflisted
call statusline#Update()
call window#FitHeight(3, 10)

let b:is_qf = empty(getloclist(0))
if b:is_qf
  wincmd J
  " Open in vertical split.
  nnoremap <buffer> v <C-w><CR><C-w>H<C-w>b<C-w>J:call window#FitHeight(3, 10)<CR><C-w>t
  " Open in vertical split and focus on results.
  nnoremap <buffer> <C-v> <C-w><CR><C-w>H<C-w>b<C-w>J:call window#FitHeight(3, 10)<CR>
else
  " Open in vertical split.
  nnoremap <buffer> v <C-w><CR><C-w>H<C-w>b:call window#FitHeight(3, 10)<CR><C-w>t
  " Open in vertical split and focus on results.
  nnoremap <buffer> <C-v> <C-w><CR><C-w>H<C-w>b:call window#fitHeight(3, 10)<CR>
endif

" Open in new tab.
nnoremap <buffer> t <C-w><CR><C-w>T
" Open in new tab and focus on results.
nnoremap <buffer> <C-t> <C-w><CR><C-w>TgT<C-w>p
" Open.
nnoremap <buffer> o <CR>
" Open and focus on results.
nnoremap <buffer> <C-o> <CR><C-w>b
" Open in horizontal split.
nnoremap <buffer> x <C-w><CR><C-w>K
" Open in horizontal split and focus on results.
nnoremap <buffer> <C-x> <C-w><CR><C-w>K<C-w>b

" Quit Vim if the last window is a quickfix window.
autocmd BufEnter <buffer> nested if winnr('$') < 2 | q | endif
