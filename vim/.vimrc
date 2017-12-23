""" Functions
function! AdjustHeight(minHeight, maxHeight) abort
  exe max([min([line("$"), a:maxHeight]), a:minHeight])."wincmd _"
endfunction

function! CompileCpp() abort
  let l:fileName = expand('%')
  let l:baseName = expand('%:r')
  if !filereadable("./Makefile")
    setlocal makeprg=g++\ -std=c++14\ -g\ -Wall\ -Wextra\ -fsanitize=undefined,address\ %\ -o\ %:r
  endif
  make!
  echo 'Finished compiling!'
endfunction

function! RunCpp() abort
  let l:filePath = expand('%:p:r')
  execute '!'.l:filePath
endfunction

function! CompileJava() abort
  let l:fileName = expand('%')
  setlocal errorformat=%A%f:%l:\ %m,%-Z%p^,%-C%.%#
  if !filereadable("./Makefile")
    setlocal makeprg=javac\ %
  endif
  make!
  echo "Finished compiling"
endfunction

function! RunJava() abort
  let l:baseName = expand('%:r')
  execute '!java '.l:baseName
endfunction

""" Plugins
"" Download vim-plug if it does not exist
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  augroup vimplug_group
    autocmd!
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
  augroup END
endif
call plug#begin('~/.vim/plugged')

"" Color Scheme
Plug 'romainl/flattened'

"" Useful plugs
" Handy bracket mappings
Plug 'tpope/vim-unimpaired'
" UNIX shell commands
Plug 'tpope/vim-eunuch'
" Surrounding text
Plug 'tpope/vim-surround'
" Keybindings for easily commenting out text
Plug 'tpope/vim-commentary'
" Improves quickfix
Plug 'romainl/vim-qf'
" Pipe ilist and dlist into quickfix
Plug 'romainl/vim-qlist'
" Auto brackets
Plug 'raimondi/delimitMate'
" Indent character
Plug 'yggdroot/indentline'
" Snippets
Plug 'joereynolds/vim-minisnip'

"" Auto completion and linting
Plug 'Shougo/neocomplete.vim'
Plug 'Shougo/neoinclude.vim'

Plug 'ternjs/tern_for_vim'
Plug 'davidhalter/jedi-vim'
Plug 'Rip-Rip/clang_complete'
Plug 'lervag/vimtex'

Plug 'w0rp/ale'

"" Git integration
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'

"" File explorer
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'justinmk/vim-dirvish'

"" Tags
Plug 'ludovicchabant/vim-gutentags'

"" Buffer line in tabline
Plug 'ap/vim-buftabline'

"" Languages
Plug 'hkmix/vim-george'
" Plug 'sheerun/vim-polyglot'
" Plug 'mattn/emmet-vim'
" Plug 'moll/vim-node'
" Plug 'jaawerth/nrun.vim'
" Plug 'pangloss/vim-javascript'
" Plug 'jelera/vim-javascript-syntax'
" Plug 'mxw/vim-jsx'
" Plug 'maksimr/vim-jsbeautify'
" Plug 'digitaltoad/vim-jade'
" Plug 'octol/vim-cpp-enhanced-highlight'
" Plug 'fatih/vim-go'
" Plug 'wlangstroth/vim-racket'
" Plug 'guns/vim-clojure-static'

call plug#end()


""" Config for plugins
"" Config for completion plugins
" Config for clang_complete
let g:clang_complete_auto = 0
let g:clang_auto_select = 0
let g:clang_omnicppcomplete_compliance = 0
let g:clang_make_default_keymappings = 0
let g:clang_user_options = '-std=c++11'
let g:clang_close_preview = 1
set completeopt-=preview

" Config for Jedi
let g:jedi#completions_enabled = 0
let g:jedi#auto_vim_configuration = 0
let g:jedi#smart_auto_mappings = 0

" Config for Neocomplete
let g:neocomplete#enable_at_startup = 1
let g:neocomplete#auto_complete_delay = 0
let g:neocomplete#enable_smart_case = 1
let g:neocomplete#sources#syntax#min_keyword_length = 3
let g:neocomplete#max_list = 10

if !exists('g:neocomplete#sources#omni#input_patterns')
  let g:neocomplete#sources#omni#input_patterns = {}
endif

if !exists('g:neocomplete#force_omni_input_patterns')
  let g:neocomplete#force_omni_input_patterns = {}
endif

let g:neocomplete#sources#omni#input_patterns.python = '\%([^. \t]\.\|^\s*@\|^\s*from\s.\+import \|^\s*from \|^\s*import \)\w*'
let g:neocomplete#sources#omni#input_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)\w*'
let g:neocomplete#sources#omni#input_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\w*\|\h\w*::\w*'
let g:neocomplete#force_omni_input_patterns.javascript = '[^. \t]\.\w*'

augroup neocomplete_group
  autocmd!
  autocmd FileType python setlocal omnifunc=jedi#completions
  autocmd FileType javascript setlocal omnifunc=tern#Complete
  autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
  autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
  autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
augroup END

"" Config for Ale
let g:ale_linters = {
      \ 'cpp': [ 'gcc', 'clang', 'cppcheck' ],
      \ 'java': [ 'javac' ],
      \ 'javascript': [ 'eslint' ],
      \ 'python': [ 'autopep', 'flake8', 'pylint' ],
      \}

let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
let g:ale_set_quickfix = 0
let g:ale_lint_on_text_changed = 'never'
let g:ale_sign_column_always = 1

"" Config for Polyglot
let g:polyglot_disabled = ['latex']

"" Config for Dirvish
let g:dirvish_mode = ':sort ,^.*[\/],'
augroup dirvish_group
  autocmd!
  autocmd FileType dirvish nnoremap <buffer> zh :g@\v/\.[^\/]+/?$@d<CR>
augroup END

"" Config for Gutentags
let g:gutentags_cache_dir='~/.tags'
let g:gutentags_generate_on_empty_buffer=1

"" Config for IndentLine
let g:indentLine_color_term = 239
let g:indentLine_char='┊'
let g:indentLine_fileTypeExclude = ['markdown']

"" Config for DelimitMate
" Adds a new line before the autocompleted bracket
let g:delimitMate_autoclose = 1
let g:delimitMate_expand_space = 1
let g:delimitMate_expand_cr = 1
let g:delimitMate_matchpairs = "(:),[:],{:}"

"" Config for vim-qf
let g:qf_window_bottom = 1
let g:qf_loclist_window_bottom = 0
let g:qf_auto_open_quickfix = 0

"" Config for Statusline
function! RefreshStatusLine()
  for nr in range(1, winnr('$'))
    call setwinvar(nr, '&statusline', '%!StatusLine('.nr.')')
  endfor
endfunction

function! StatusLine(winnum) abort
  let active = a:winnum == winnr()
  let status = ""
  if active
    let status .= "%#statusLineLight#"
    let status .= "\ %t%{StatusLinePasteMode()}%r%h%w%m"
    let status .= "\ %#statusLineDark#"
    let status .= "%{StatusLineGitInfo()}"
    let status .= "%="
    let status .= "%y"
    let status .= "\ %{&fileencoding?&fileencoding:&encoding}"
    let status .= "\[%{&fileformat}\]"
    let status .= "\ %#statusLineLight#"
    let status .= "\ %l/%L:\ %3c"
    let status .= "\ %#statusLineAccent#"
    let status .= "%{StatusLineWarnings()}"
    let status .= "%{StatusLineAle()}"
  else
    let status .= "%#statusLineDark#"
    let status .= "\ %f"
    let status .= "%="
    let status .= "%p%%"
    let status .= "\ %#statusLineLight#"
    let status .= "\ %l/%L:\ %3c\ "
  endif
  return status
endfunction

function! StatusLinePasteMode() abort
  let l:paste_status = &paste
  if l:paste_status == 1
    return '[P]'
  endif
  return ''
endfunction

function! StatusLineGitInfo() abort
  if fugitive#head() != ""
    let info = GitGutterGetHunkSummary()
    return " ".fugitive#head()." +".info[0]." ~".info[1]." -".info[2]." "
  else
    return ""
  endif
endfunction

autocmd cursorhold,bufwritepost * unlet! b:warning_flags
function! StatusLineWarnings() abort
  if !exists("b:warning_flags")
    let tabs = search('^\t', 'nw') != 0
    let spaces = search('^ ', 'nw') != 0
    let b:warning_flags = ""

    " Mixed indenting
    if tabs && spaces
      let b:warning_flags .= 'M'

    " Inconsistent indenting
    elseif (spaces && !&et) || (tabs && &et)
      let b:warning_flags .= 'I'
    endif

    " Trailing spaces
    if search('\s\+$', 'nw') != 0
      let b:warning_flags .= 'T'
    endif

    if strlen(b:warning_flags) > 0
      let b:warning_flags = "[".b:warning_flags."]"
    endif
  endif

  return b:warning_flags
endfunction

function! StatusLineAle() abort
  " ALE output
  let ale_dict = ale#statusline#Count(bufnr('%'))
  let errors = ale_dict['error'] + ale_dict['style_error']
  let warnings = ale_dict['warning'] + ale_dict['style_warning']
  let ale_output = ""

  if errors > 0
    let ale_output .= "[!".errors."]"
  endif

  if warnings > 0
    let ale_output .= "[?".warnings."]"
  endif

  return ale_output
endfunction


"" Config for Vimtex
let g:vimtex_compiler_latexmk = {'callback' : 0}
let g:latex_view_general_viewer = "zathura"
let g:vimtex_view_method = "zathura"
let g:tex_conceal = ""

"" Config for Fzf
function! s:tags_sink(lines) abort
  if empty(a:lines)
    return
  endif
  let cmd = get({
        \ 'ctrl-t': 'tabedit',
        \ 'ctrl-x': 'split',
        \ 'ctrl-v': 'vsplit',
        \ }, remove(a:lines, 0), 'e')
  let query = a:lines[0]
  let parts = split(query, '\t\zs')
  let excmd = matchstr(parts[2:], '^.*\ze;"\t')
  execute 'silent ' cmd parts[1][:-2]
  let [magic, &magic] = [&magic, 0]
  execute excmd
  let &magic = magic
endfunction

command! Tags call fzf#run(fzf#wrap({
        \ 'source':  'cat '.join(map(tagfiles(), 'fnamemodify(v:val, ":S")')).
        \            '| grep -v -a ^!',
        \ 'options': '+m -d "\t" --with-nth 1,4.. -n 1 --tiebreak=index --expect=ctrl-x,ctrl-v',
        \ 'down': '10',
        \ 'sink*':    function('s:tags_sink'),
        \ }))
command! Buffers call fzf#run(fzf#wrap({
      \ 'source': filter(map(range(1, bufnr('$')), 'bufname(v:val)'), 'len(v:val)'),
      \ }))
command! MRU call fzf#run(fzf#wrap({
      \ 'source': v:oldfiles,
      \ }))

if executable('ack')
  set grepprg=ack\ -i\ --nocolor\ --nogroup\ ""\ %s
elseif executable('ag')
  set grepprg=ag\ --nogroup\ --nocolor
endif


""" General config
"" Indentation
set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab
set autoindent
set smarttab
set cindent
set nowrap

"" Line/column numbers
set number
set relativenumber
set laststatus=2

"" No beeping or error sounds
set noerrorbells
set novisualbell
set belloff=all
set t_vb=
set tm=500

"" Searching config
set nohlsearch
set incsearch
set ignorecase
set smartcase

"" Color scheme config
set t_Co=256
set background=dark
silent! colorscheme flattened_dark

"" Wildmenu config
set wildmenu
set wildmode=full
set wildignore=.hg,.git,.svn                     " Version control
set wildignore+=*.aux,*.out,*.toc                " LaTeX intermediate files
set wildignore+=*.jpg,*.bmp,*.gif,*.png,*.jpeg   " binary images
set wildignore+=*.o,*.obj,*.exe,*.dll,*.manifest " compiled object files
set wildignore+=*.sw?                            " Vim swap files
set wildignore+=*.DS_Store                       " OSX garbage
set wildignore+=*.pdf,*.zip,*.so                 " Binaries
set wildignore+=*.pyc,*.pyo                      " Python byte code

"" Other config
set conceallevel=0
set backspace=2
set autoread
set autowrite
set shortmess=aIT
set encoding=utf-8
set fileencoding=utf-8
set lazyredraw
set showtabline=2
set showmode
set showcmd
set cmdheight=2
set mouse=a
set nomousehide
set infercase
set nojoinspaces

"" Vim info config
set viminfo='500 " remember marks for last 500 files
set viminfo+=<1000 " remember up to 1000 lines in each register
set viminfo+=s1000 " remember up to 1MB in each register
set viminfo+=/1000 " remember last 1000 search patterns
set viminfo+=:1000 " remember last 1000 commands
set viminfo+=n$HOME/.vim/viminfo

"" Setting undo, backup, and swp directories
set undofile
set undodir=~/.vim/.undo//
set backup
set backupdir=~/.vim/.backup//
set directory=~/.vim/.swp//

" Create necessary directories
if exists("*mkdir")
  for dir in ["/.vim/.backup", "/.vim/.swp", "/.vim/.undo", "/.tags"]
    if !isdirectory($HOME . dir)
      call mkdir($HOME . dir, "p")
    endif
  endfor
endif


""" Key bindings
"" Remap leader
let g:mapleader="\<Space>"

"" Regular j, k moves across visual lines
"" Numbered j, k moves across physical lines
nnoremap <expr> j v:count ? 'j' : 'gj'
nnoremap <expr> k v:count ? 'k' : 'gk'

"" Delete trailing whitespace
nnoremap <F6> :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar><CR>

"" Copy into clipboard
vnoremap <C-c> "+y

"" Easy split navigation
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
nnoremap <C-h> <C-w>h

set splitbelow
set splitright

"" Resize viewports with arrow keys
nnoremap <Right> :vertical resize +2<CR>
nnoremap <Left> :vertical resize -2<CR>
nnoremap <Up> :resize +2<CR>
nnoremap <Down> :resize -2<CR>

"" Reload .vimrc
noremap <leader>rr :source ~/.vimrc<CR>

"" Fugitive bindings
nnoremap <leader>gs :Gstatus<CR>
nnoremap <leader>gd :Gdiff<CR>
nnoremap <leader>gD :Gdiff HEAD<CR>
nnoremap <leader>gc :Gcommit<CR>
nnoremap <leader>gl :Git log<CR>
nnoremap <leader>gp :Git push<CR>
nnoremap <leader>gw :Gwrite<CR>
nnoremap <leader>gr :Gremove<CR>
nnoremap <leader>gg :Ggrep<Space>

"" Fzf keybindings
nnoremap <leader>b :Buffers<CR>
nnoremap <leader>p :FZF<CR>
nnoremap <leader>m :MRU<CR>
nnoremap <leader>t :Tags<CR>

"" Grep for word under cursor
nnoremap K :execute 'grep!"\b"'.expand('<cword>').'"\b"'<CR>:cw<CR>

"" Indentation in visual mode should stay in visual mode
xnoremap > >gv
xnoremap < <gv

"" Consistent behavior
nnoremap Y y$

"" Sudoedit a file
cnoremap w!! %!sudo tee > /dev/null %

"" Neocomplete bindings
inoremap <expr><C-j> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr><C-k> pumvisible() ? "\<C-p>" : "\<S-Tab>"

"" Sharing snippets
command! -range=% SP  <line1>,<line2>w !curl -F 'sprunge=<-' http://sprunge.us | tr -d '\n' | xclip -i -selection clipboard
command! -range=% CL  <line1>,<line2>w !curl -F 'clbin=<-' https://clbin.com | tr -d '\n' | xclip -i -selection clipboard
command! -range=% VP  <line1>,<line2>w !curl -F 'text=<-' http://vpaste.net | tr -d '\n' | xclip -i -selection clipboard
command! -range=% IX  <line1>,<line2>w !curl -F 'f:1=<-' ix.io | tr -d '\n' | xclip -i -selection clipboard
command! -range=% TB  <line1>,<line2>w !nc termbin 9999 | tr -d '\n' | xclip -i -selection clipboard

"" Make single quote act like backtick
nnoremap ' `

"" Backspace to switch to alternate file
nnoremap <BS> <C-^>

""" Highlighting config
"" Underline current line
set cursorline

function! Highlight() abort
  "" Highlighting for cursorline
  highlight clear CursorLine
  highlight CursorLine cterm=underline

  "" Highlighting for transparent background
  highlight Normal ctermbg=none
  highlight NonText ctermbg=none
  highlight LineNr ctermbg=none
  highlight VertSplit ctermbg=none

  "" Highlighting for GitGutter symbols
  highlight GitGutterAdd ctermbg=none ctermfg=64
  highlight GitGutterChange ctermbg=none ctermfg=136
  highlight GitGutterDelete ctermbg=none ctermfg=160
  highlight GitGutterChangeDelete ctermbg=none ctermfg=136

  "" Highlighting for ALE symbols
  highlight ALEErrorSign ctermbg=none ctermfg=160
  highlight ALEWarningSign ctermbg=none ctermfg=136

  "" Highlighting for latex
  highlight texMathMatcher ctermbg=none
  highlight texMathZoneX ctermbg=none
  highlight texRefLabel ctermbg=none
  highlight texStatement ctermbg=none

  "" Highlighting for markdown
  highlight def link markdownItalic NONE
  highlight def link markdownItalicDelimiter NONE
  highlight def link markdownBold NONE
  highlight def link markdownBoldDelimiter NONE
  highlight def link markdownBoldItalic NONE
  highlight def link markdownBoldItalicDelimiter NONE

  "" Highlighting for BufTabLine
  highlight BufTabLineCurrent cterm=none ctermfg=8 ctermbg=12
  highlight BufTabLineActive cterm=none ctermfg=8 ctermbg=10
  highlight BufTabLineHidden cterm=none ctermfg=8 ctermbg=10
  highlight BufTabLineFill ctermfg=0 ctermbg=0

  "" Highlighting for statusline
  highlight statusLineDark ctermfg=12 ctermbg=0
  highlight statusLineLight ctermfg=15 ctermbg=10
  highlight statusLineAccent ctermfg=15 ctermbg=160
endfunction


""" Autocommands
"" Quick fix related autocommands
augroup quick_fix_group
  autocmd!
  "" Convenient quickfix macros
  " Open in new tab
  autocmd Filetype qf nnoremap <buffer> t <C-w><CR><C-w>T
  " Open in new tab and focus on results
  autocmd Filetype qf nnoremap <buffer> <C-t> <C-w><CR><C-w>TgT<C-w>p
  " Open
  autocmd Filetype qf nnoremap <buffer> o <CR>
  " Open and focus on results
  autocmd Filetype qf nnoremap <buffer> <C-o> <CR><C-w>b
  " Open in vertical split
  autocmd Filetype qf nnoremap <buffer> v <C-w><CR><C-w>H<C-w>b<C-w>J:call AdjustHeight(3, 10)<CR><C-w>t
  " Open in vertical split and focus on results
  autocmd Filetype qf nnoremap <buffer> <C-v> <C-w><CR><C-w>H<C-w>b<C-w>J:call AdjustHeight(3, 10)<CR>
  " Open in horizontal split
  autocmd Filetype qf nnoremap <buffer> x <C-w><CR><C-w>K
  " Open in horizontal split and focus on results
  autocmd Filetype qf nnoremap <buffer> <C-x> <C-w><CR><C-w>K<C-w>b
augroup END

"" cpp related autocommands
augroup cpp_group
  autocmd!
  autocmd Filetype cpp nnoremap <buffer> <F4> :call CompileCpp()<CR>
  autocmd Filetype cpp nnoremap <buffer> <F5> :call RunCpp()<CR>
augroup END

"" latex related autocommands
augroup latex_group
  autocmd!
  autocmd Filetype tex nmap <buffer> <F3> <plug>(vimtex-compile)
  autocmd Filetype tex nmap <buffer> <F4> <plug>(vimtex-errors)
  autocmd Filetype tex nmap <buffer> <F5> <plug>(vimtex-view)
augroup END

"" java related autocommands
augroup java_group
  autocmd!
  autocmd Filetype java nnoremap <buffer> <F4> :call CompileJava()<CR>
  autocmd Filetype java nnoremap <buffer> <F5> :call RunJava()<CR>
augroup END

"" markdown related autocommands
augroup markdown_group
  autocmd!
  autocmd Filetype markdown setlocal makeprg=pandoc\ -s\ -o\ %:r.pdf\ %
augroup END

"" highlighting autocommands
call Highlight()
augroup highlighting_group
  autocmd!
  autocmd ColorScheme * call Highlight()
augroup end

"" statusline autocommands
augroup statusline_group
  autocmd!
  autocmd VimEnter,WinEnter,BufWinEnter * call RefreshStatusLine()
augroup end

"" cursorline autocommands
augroup cursorline_group
  autocmd!
  autocmd WinLeave * set nocursorline
  autocmd WinEnter * set cursorline
augroup END
