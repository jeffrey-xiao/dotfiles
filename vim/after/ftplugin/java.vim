" General config.
setlocal errorformat=%A%f:%l:\ %m,%-Z%p^,%-C%.%#
setlocal commentstring=//\ %s

" Functions.
function! CompileJava() abort
  let l:fileName = expand('%')
  if !filereadable('./Makefile')
    setlocal makeprg=javac\ %
  endif
  silent make! | redraw!
  echo "Finished Compiling"
endfunction

function! RunJava() abort
  let l:folderPath = expand('%:p:h')
  let l:baseName = expand('%:t:r')
  execute '!java -Xmx100M -Xss100M -ea -cp '.l:folderPath.' '.l:baseName
endfunction

" Keybindings.
nnoremap <buffer> <leader>c :call CompileJava()<CR>
nnoremap <buffer> <leader>e :call RunJava()<CR>
