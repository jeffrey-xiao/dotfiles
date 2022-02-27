" General config.
setlocal errorformat+=%-G%.%#
setlocal commentstring=//\ %s
if executable('clang-format')
  setlocal formatexpr=FormatCpp(v:lnum,v:lnum+v:count-1)
endif
if !filereadable('./Makefile')
  setlocal makeprg=g++\ -std=c++14\ -g\ -Wall\ -Wextra\ -fsanitize=undefined,address\ %\ -o\ %:r
endif

" Functions.
function! FormatCpp(start, end) abort
  let l:saved_view = winsaveview()
  silent execute('%!clang-format --assume-filename=% --lines='.a:start.':'.a:end)
  call winrestview(l:saved_view)
  echo "Finished formatting."
endfunction

" Keybindings.
nnoremap <buffer> <leader>c :silent make \| redraw! \| echo "Finished compiling."<CR>
nnoremap <buffer> <leader>e :!%:p:r<CR>
