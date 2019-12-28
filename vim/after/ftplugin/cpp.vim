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
  echo "Finished formatting"
endfunction

function! CompileCpp() abort
  silent make!
  redraw!
  echo "Finished compiling"
endfunction

function! RunCpp() abort
  execute '!%:p:r'
endfunction

" Keybindings.
nnoremap <buffer> <leader>c :call CompileCpp()<CR>
nnoremap <buffer> <leader>e :call RunCpp()<CR>
