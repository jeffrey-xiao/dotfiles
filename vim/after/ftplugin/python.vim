" General config.
setlocal omnifunc=jedi#completions
if executable('yapf')
  setlocal formatexpr=FormatPython(v:lnum,v:lnum+v:count-1)
endif

" Functions.
function! FormatPython(start, end) abort
  let l:saved_view = winsaveview()
  silent execute('%!yapf --lines='.a:start.'-'.a:end)
  call winrestview(l:saved_view)
  echo "Finished formatting."
endfunction

function! RunPython() abort
  execute '!python %'
endfunction

" Keybindings.
nnoremap <buffer> <leader>e :call RunPython()<CR>
