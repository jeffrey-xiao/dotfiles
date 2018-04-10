"" Functions
function! CompileJava() abort
  let l:fileName = expand('%')
  setlocal errorformat=%A%f:%l:\ %m,%-Z%p^,%-C%.%#
  if !filereadable('./Makefile')
    setlocal makeprg=javac\ %
  endif
  make!
  echo 'Finished compiling'
endfunction

function! RunJava() abort
  let l:baseName = expand('%:r')
  execute '!java -ea '.l:baseName
endfunction


"" Keybindings
nnoremap <buffer> <F4> :call CompileJava()<CR>
nnoremap <buffer> <F5> :call RunJava()<CR>
