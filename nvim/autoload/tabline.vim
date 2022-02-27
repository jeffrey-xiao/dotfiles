" Updates the tab line if there are more than one tab.
function! tabline#Update() abort
  if tabpagenr('$') >= 2
    set tabline=%!tabline#Tabline()
  endif
endfunction

" Returns the tab line.
function! tabline#Tabline() abort
  let s = ''
  let t = tabpagenr()
  let i = 1
  while i <= tabpagenr('$')
    let buflist = tabpagebuflist(i)
    let winnr = tabpagewinnr(i)
    let s .= '%'.i.'T'
    let s .= (i == t ? '%1*' : '%2*')

    let s .= (i == t ? '%#TabNumSel#' : '%#TabNum#')
    let s .= ' '.i
    let s .= (i == t ? '%#TabLineSel#' : '%#TabLine#')

    let bufnr = buflist[winnr - 1]
    let file = bufname(bufnr)
    let buftype = getbufvar(bufnr, '&buftype')

    if buftype == 'help'
      let file = 'help:'.fnamemodify(file, ':t:r')
    elseif buftype == 'quickfix'
      let file = 'quickfix'
    elseif buftype == 'nofile' && file =~ '\/.'
      let file = substitute(file, '.*\/\ze.', '', '')
    elseif file == ''
      let file = '[No Name]'
    else
      let file = pathshorten(fnamemodify(file, ':p:~:.'))
    endif

    if getbufvar(bufnr, '&modified')
      let file = file.'[+]'
    endif

    let s .= ' '.file

    if i < tabpagenr('$')
      let s .= ' %#TabLine#'
    else
      let s .= ' '
    endif

    let i = i + 1
  endwhile

  let s .= '%#TabLineFill#%T'
  if tabpagenr('$') > 1
    let s .= '%=%#TabLineSel#%999X X '
  endif
  return s
endfunction
