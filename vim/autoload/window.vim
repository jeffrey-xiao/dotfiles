" Adjusts the height of the current window to have a minimum of minHeight
" lines and a maximum of maxHeight lines.
function! window#fitHeight(minHeight, maxHeight) abort
  execute max([min([line('$'), a:maxHeight]), a:minHeight]).'wincmd _'
endfunction

" Tmux-like zooming.
function! window#zoom() abort
  if exists('t:zoom_winrestcmd')
    if winnr('$') > 1
      execute t:zoom_winrestcmd
    endif
    unlet t:zoom_winrestcmd
  elseif winnr('$') > 1
    let t:zoom_winrestcmd = winrestcmd()
    resize
    vertical resize
  endif
endfunction
