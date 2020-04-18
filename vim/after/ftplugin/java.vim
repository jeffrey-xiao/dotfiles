" General config.
setlocal errorformat=%A%f:%l:\ %m,%-Z%p^,%-C%.%#,%-G%.%#
setlocal commentstring=//\ %s
if executable('clang-format')
  setlocal formatexpr=FormatJava(v:lnum,v:lnum+v:count-1)
endif
if !filereadable('./Makefile')
  setlocal makeprg=javac\ %
endif

" Functions.
function! FormatJava(start, end) abort
  let l:saved_view = winsaveview()
  silent execute('%!clang-format --assume-filename=% --lines='.a:start.':'.a:end)
  call winrestview(l:saved_view)
  echo "Finished formatting."
endfunction

function! s:compile_java() abort
  silent make!
  redraw!
  echo "Finished compiling."
  cwindow
  if !empty(getqflist())
    cfirst
  endif
endfunction

" Keybindings.
nnoremap <buffer> <leader>c :call <SID>compile_java()<CR>
nnoremap <buffer> <leader>e :!java -Xmx100M -Xss100M -ea -cp %:p:h %:t:r<CR>
