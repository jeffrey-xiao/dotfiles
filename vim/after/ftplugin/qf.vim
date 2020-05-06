" Fit height.
call window#fitHeight(3, 10)

" Open in new tab.
nnoremap <buffer> t <C-w><CR><C-w>T
" Open in new tab and focus on results.
nnoremap <buffer> <C-t> <C-w><CR><C-w>TgT<C-w>p
" Open.
nnoremap <buffer> o <CR>
" Open and focus on results.
nnoremap <buffer> <C-o> <CR><C-w>b
" Open in vertical split.
nnoremap <buffer> v <C-w><CR><C-w>H<C-w>b<C-w>J:call window#fitHeight(3, 10)<CR><C-w>t
" Open in vertical split and focus on results.
nnoremap <buffer> <C-v> <C-w><CR><C-w>H<C-w>b<C-w>J:call window#fitHeight(3, 10)<CR>
" Open in horizontal split.
nnoremap <buffer> x <C-w><CR><C-w>K
" Open in horizontal split and focus on results.
nnoremap <buffer> <C-x> <C-w><CR><C-w>K<C-w>b
