"" Functions
function! CompileCpp() abort
  let l:fileName = expand('%')
  let l:baseName = expand('%:r')
  if !filereadable('./Makefile')
    setlocal makeprg=g++\ -std=c++14\ -g\ -Wall\ -Wextra\ -fsanitize=undefined,address\ %\ -o\ %:r
  endif
  silent make! | redraw!
  echo "Finished Compiling"
endfunction

function! RunCpp() abort
  let l:filePath = expand('%:p:r')
  execute '!'.l:filePath
endfunction


"" Keybindings
nnoremap <buffer> <F4> :call CompileCpp()<CR>
nnoremap <buffer> <F5> :call RunCpp()<CR>
