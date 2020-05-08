" Updates the status line for the current window and the last window.
function! statusline#Update() abort
  call setwinvar(winnr(), '&statusline', '%!statusline#Statusline('.winnr().')')
  if winnr('#') != 0
    call setwinvar(winnr('#'), '&statusline', '%!statusline#Statusline('.winnr('#').')')
  endif
endfunction

" Returns the status line for a specific window.
function! statusline#Statusline(winnum) abort
  let l:status = ''
  if a:winnum == winnr()
    let l:status .= '%#StatusLineLight#'
    let l:status .= ' %f%{statusline#Flags()} %#StatusLineDark# %{statusline#GitInfo()}'
    let l:status .= '%='
    let l:status .= '%{strlen(&filetype)?&filetype:"no ft"}'
    let l:status .= ' | %{strlen(&fileencoding)?&fileencoding:&encoding}'
    let l:status .= ' | %{&fileformat}'
    let l:status .= ' %#StatusLineLight#'
    let l:status .= ' %l/%L: %3c'
    let l:status .= ' %#StatusLineAccent#'
    let l:status .= '%{statusline#WarningFlags()}'
    let l:status .= '%{statusline#AleFlags()}'
  else
    let l:status .= '%#StatusLineDark#'
    let l:status .= ' %f'
    let l:status .= '%='
    let l:status .= '%p%%'
    let l:status .= ' %#StatusLineLight#'
    let l:status .= ' %l/%L: %3c '
  endif
  return l:status
endfunction

function! statusline#Flags() abort
  let l:modes = ''
  let l:modes .= statusline#PasteFlag()
  let l:modes .= statusline#ZoomFlag()
  let l:modes .= statusline#ModifiedFlag()
  let l:modes .= statusline#ReadOnlyFlag()
  if l:modes != ''
    let l:modes = '['.l:modes.']'
  endif
  return l:modes
endfunction

function! statusline#ModifiedFlag() abort
  if &modified == 1
    return '+'
  elseif &modifiable == 0
    return '-'
  endif
  return ''
endfunction

function! statusline#PasteFlag() abort
  if &paste == 1
    return 'P'
  endif
  return ''
endfunction

function! statusline#ZoomFlag() abort
  if exists('t:zoom_winrestcmd')
    return 'Z'
  endif
  return ''
endfunction

function! statusline#ReadOnlyFlag() abort
  if &readonly == 1
    return '‼'
  endif
  return ''
endfunction

function! statusline#GitInfo() abort
  if fugitive#head() !=? ''
    let l:info = sy#repo#get_stats()
    if l:info[0] < 0
      return ''
    endif
    return ' '.fugitive#head().' +'.l:info[0].' ~'.l:info[1].' -'.l:info[2].' '
  else
    return ''
  endif
endfunction

function! statusline#WarningFlags() abort
  if !exists('b:warning_flags')
    let l:tabs = search('^\t', 'nw') != 0
    let l:spaces = search('^ ', 'nw') != 0
    let b:warning_flags = ''

    " Mixed indenting.
    if l:tabs && l:spaces
      let b:warning_flags .= 'M'

    " Inconsistent indenting.
    elseif (l:spaces && !&expandtab) || (l:tabs && &expandtab)
      let b:warning_flags .= 'I'
    endif

    " Trailing spaces.
    if search('\s\+$', 'nw') != 0
      let b:warning_flags .= 'T'
    endif

    if strlen(b:warning_flags) > 0
      let b:warning_flags = '['.b:warning_flags.']'
    endif
  endif

  return b:warning_flags
endfunction

function! statusline#AleFlags() abort
  " ALE output.
  let l:ale_dict = ale#statusline#Count(bufnr('%'))
  let l:errors = l:ale_dict['error'] + l:ale_dict['style_error']
  let l:warnings = l:ale_dict['warning'] + l:ale_dict['style_warning']
  let l:ale_output = ''

  if l:errors > 0
    let l:ale_output .= '[!'.l:errors.']'
  endif

  if l:warnings > 0
    let l:ale_output .= '[?'.l:warnings.']'
  endif

  return l:ale_output
endfunction
