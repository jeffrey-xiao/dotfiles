" General config.
setlocal commentstring=//\ %s

" Functions.
function! CompileCpp() abort
  let l:fileName = expand('%')
  let l:baseName = expand('%:r')
  if !filereadable('./Makefile')
    setlocal makeprg=g++\ -std=c++14\ -g\ -Wall\ -Wextra\ -fsanitize=undefined,address\ %\ -o\ %:r
  endif
  silent make!
  redraw!
  echo "Finished compiling"
endfunction

function! RunCpp() abort
  let l:filePath = expand('%:p:r')
  execute '!'.l:filePath
endfunction

" Keybindings.
nnoremap <buffer> <leader>c :call CompileCpp()<CR>
nnoremap <buffer> <leader>e :call RunCpp()<CR>
