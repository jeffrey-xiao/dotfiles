" General config.
if executable('clang-format')
  setlocal formatexpr=FormatCpp(v:lnum,v:lnum+v:count-1)
endif
if !filereadable('./Makefile')
  setlocal makeprg=g++\ -std=c++14\ -g\ -Wall\ -Wextra\ -fsanitize=undefined,address\ %\ -o\ %:r
endif
setlocal errorformat+=%-G%.%#
setlocal commentstring=//\ %s

" Functions.
function! FormatCpp(start, end) abort
  let l:saved_view = winsaveview()
  silent execute('%!clang-format --assume-filename=% --lines='.a:start.':'.a:end)
  call winrestview(l:saved_view)
  echo "Finished formatting."
endfunction

function! s:compile_cpp() abort
  silent make!
  redraw!
  echo "Finished compiling."
  cwindow
  if !empty(getqflist())
    cfirst
  endif
endfunction

" Keybindings.
nnoremap <buffer> <leader>c :call <SID>compile_cpp()<CR>
nnoremap <buffer> <leader>e :!%:p:r<CR>
