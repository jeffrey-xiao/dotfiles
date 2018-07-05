"" Functions
function! RefreshStatusLine() abort
  for l:nr in range(1, winnr('$'))
    call setwinvar(l:nr, '&statusline', '%!StatusLine('.l:nr.')')
  endfor
endfunction

function! StatusLine(winnum) abort
  let l:active = a:winnum == winnr()
  let l:status = ''
  if l:active
    let l:status .= '%#statusLineLight#'
    let l:status .= ' %f%{StatusLinePasteMode()}%r%h%w%m'
    let l:status .= ' %#statusLineDark#'
    let l:status .= '%{StatusLineGitInfo()}'
    let l:status .= '%='
    let l:status .= '%{strlen(&filetype)?&filetype:"no ft"}'
    let l:status .= ' | %{strlen(&fileencoding)?&fileencoding:&encoding}'
    let l:status .= ' | %{&fileformat}'
    let l:status .= ' %#statusLineLight#'
    let l:status .= ' %l/%L: %3c'
    let l:status .= ' %#statusLineAccent#'
    let l:status .= '%{StatusLineWarnings()}'
    let l:status .= '%{StatusLineAle()}'
  else
    let l:status .= '%#statusLineDark#'
    let l:status .= ' %f'
    let l:status .= '%='
    let l:status .= '%p%%'
    let l:status .= ' %#statusLineLight#'
    let l:status .= ' %l/%L: %3c '
  endif
  return l:status
endfunction

function! StatusLinePasteMode() abort
  let l:paste_status = &paste
  if l:paste_status == 1
    return '[P]'
  endif
  return ''
endfunction

function! StatusLineGitInfo() abort
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

function! StatusLineWarnings() abort
  if !exists('b:warning_flags')
    let l:tabs = search('^\t', 'nw') != 0
    let l:spaces = search('^ ', 'nw') != 0
    let b:warning_flags = ''

    " Mixed indenting
    if l:tabs && l:spaces
      let b:warning_flags .= 'M'

    " Inconsistent indenting
    elseif (l:spaces && !&expandtab) || (l:tabs && &expandtab)
      let b:warning_flags .= 'I'
    endif

    " Trailing spaces
    if search('\s\+$', 'nw') != 0
      let b:warning_flags .= 'T'
    endif

    if strlen(b:warning_flags) > 0
      let b:warning_flags = '['.b:warning_flags.']'
    endif
  endif

  return b:warning_flags
endfunction

function! StatusLineAle() abort
  " ALE output
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


"" Autocommands
augroup statusline_group
  autocmd!
  autocmd cursorhold,bufwritepost * unlet! b:warning_flags
  autocmd VimEnter,WinEnter,BufWinEnter * call RefreshStatusLine()
augroup end
