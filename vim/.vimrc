""" Functions
function! AdjustHeight(minHeight, maxHeight) abort
  exe max([min([line('$'), a:maxHeight]), a:minHeight]).'wincmd _'
endfunction


""" Plugins
"" Download vim-plug if it does not exist
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl --fail --location --create-dirs --output ~/.vim/autoload/plug.vim
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  augroup vimplug_group
    autocmd!
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
  augroup END
endif

filetype plugin on
syntax on
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
" Repeating plugin maps
Plug 'tpope/vim-repeat'
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

Plug 'Rip-Rip/clang_complete'
Plug 'davidhalter/jedi-vim'
Plug 'lervag/vimtex'
Plug 'racer-rust/vim-racer'
Plug 'ternjs/tern_for_vim'

Plug 'w0rp/ale'

"" Git integration
Plug 'mhinz/vim-signify'
Plug 'tpope/vim-fugitive'

"" File explorer
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all --xdg' }
Plug 'justinmk/vim-dirvish'

"" Tags
Plug 'ludovicchabant/vim-gutentags'

"" Buffer line in tabline
Plug 'ap/vim-buftabline'

"" Languages
Plug 'christoomey/vim-tmux-navigator'
Plug 'elixir-editors/vim-elixir'
Plug 'octol/vim-cpp-enhanced-highlight'
Plug 'pangloss/vim-javascript'
Plug 'rust-lang/rust.vim'
" Plug 'hkmix/vim-george'
" Plug 'sheerun/vim-polyglot'
" Plug 'mattn/emmet-vim'
" Plug 'moll/vim-node'
" Plug 'jaawerth/nrun.vim'
" Plug 'mxw/vim-jsx'
" Plug 'jelera/vim-javascript-syntax'
" Plug 'maksimr/vim-jsbeautify'
" Plug 'digitaltoad/vim-jade'
" Plug 'fatih/vim-go'
" Plug 'wlangstroth/vim-racket'
" Plug 'guns/vim-clojure-static'

call plug#end()


""" Config for plugins
"" Config for completion plugins
" Config for clang_complete
let g:clang_auto_select = 0
let g:clang_close_preview = 1
let g:clang_complete_auto = 0
let g:clang_make_default_keymappings = 0
let g:clang_omnicppcomplete_compliance = 0
let g:clang_user_options = '-std=c++11'
set completeopt-=preview

" Config for Jedi
let g:jedi#auto_vim_configuration = 0
let g:jedi#completions_enabled = 0
let g:jedi#smart_auto_mappings = 0

"" Config for racer
let g:racer_cmd = '/home/jeffreyxiao/.cargo/bin/racer'
let g:racer_experimental_completer = 1

" Config for Neocomplete
let g:neocomplete#auto_complete_delay = 0
let g:neocomplete#enable_at_startup = 1
let g:neocomplete#enable_smart_case = 1
let g:neocomplete#max_list = 10
let g:neocomplete#sources#syntax#min_keyword_length = 3

if !exists('g:neocomplete#sources#omni#input_patterns')
  let g:neocomplete#sources#omni#input_patterns = {}
endif

if !exists('g:neocomplete#force_omni_input_patterns')
  let g:neocomplete#force_omni_input_patterns = {}
endif

let g:neocomplete#force_omni_input_patterns.javascript = '[^. \t]\.\w*'
let g:neocomplete#sources#omni#input_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)\w*'
let g:neocomplete#sources#omni#input_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\w*\|\h\w*::\w*'
let g:neocomplete#sources#omni#input_patterns.python = '\%([^. \t]\.\|^\s*@\|^\s*from\s.\+import \|^\s*from \|^\s*import \)\w*'
let g:neocomplete#sources#omni#input_patterns.rust = '[^.[:digit:] *\t]\%(\.\|\::\)\%(\h\w*\)\?'
let g:neocomplete#sources#omni#input_patterns.tex = '\v\\%(\a*%(ref|cite)\a*%(\s*\[[^]]*\])?\s*\{[^{}]*|includegraphics%(\s*\[[^]]*\])?\s*\{[^{}]*|%(include|input)\s*\{[^{}]*)'

"" Config for Ale
let g:ale_linters = {
      \ 'cpp': [ 'gcc', 'clang', 'cppcheck' ],
      \ 'java': [ 'javac' ],
      \ 'javascript': [ 'eslint' ],
      \ 'python': [ 'autopep', 'flake8', 'pylint' ],
      \}

let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_lint_on_text_changed = 'never'
let g:ale_set_quickfix = 0
let g:ale_sign_column_always = 1

"" Config for Polyglot
let g:polyglot_disabled = [ 'latex' ]

"" Config for Dirvish
let g:dirvish_mode = ':sort ,^.*[\/],'
augroup dirvish_group
  autocmd!
  autocmd Filetype dirvish nnoremap <buffer> zh :g@\v/\.[^\/]+/?$@d<CR>
augroup END

"" Config for Gutentags
let g:gutentags_cache_dir = '~/.vim/tags'
let g:gutentags_generate_on_empty_buffer = 1

"" Config for IndentLine
let g:indentLine_char = '|'
let g:indentLine_color_term = 239
let g:indentLine_fileTypeExclude = [ 'markdown', 'json' ]

"" Config for DelimitMate
" Adds a new line before the autocompleted bracket
let g:delimitMate_autoclose = 1
let g:delimitMate_expand_cr = 1
let g:delimitMate_expand_space = 1
let g:delimitMate_matchpairs = '(:),[:],{:}'

"" Config for vim-qf
let g:qf_auto_open_quickfix = 0
let g:qf_loclist_window_bottom = 0
let g:qf_window_bottom = 1

"" Config for BufTabLine
let g:buftabline_numbers = 1

"" Config for Vimtex
let g:latex_view_general_viewer = 'zathura'
let g:tex_conceal = ''
let g:tex_flavor = "latex"
let g:vimtex_compiler_latexmk = { 'callback' : 0 }
let g:vimtex_syntax_minted = [
      \ { 'lang' : 'c' },
      \ { 'lang' : 'cpp' },
      \ { 'lang' : 'java' },
      \ { 'lang' : 'python' },
      \]
let g:vimtex_view_method = 'zathura'

"" Config for signify
let g:signify_sign_change = '~'
let g:signify_sign_changedelete = '~_'
let g:signify_sign_delete_first_line = '_'
let g:signify_sign_show_count = 0
let g:signify_vcs_list = [ 'git' ]

"" Config for Fzf
function! s:tags_sink(lines) abort
  if empty(a:lines)
    return
  endif
  let l:cmd = get({
        \ 'ctrl-t': 'tabedit',
        \ 'ctrl-x': 'split',
        \ 'ctrl-v': 'vsplit',
        \ }, remove(a:lines, 0), 'e')
  let l:query = a:lines[0]
  let l:parts = split(l:query, '\t\zs')
  let l:excmd = matchstr(l:parts[2:], '^.*\ze;"\t')
  execute 'silent ' l:cmd l:parts[1][:-2]
  let [l:magic, &magic] = [&magic, 0]
  execute l:excmd
  let &magic = l:magic
endfunction

command! Tags call fzf#run(fzf#wrap({
      \ 'source':  'cat '.join(map(tagfiles(), 'fnamemodify(v:val, ":S")')).
      \            '| grep --invert-match --text ^!',
      \ 'options': '+m -d "\t" --with-nth 1,4.. -n 1 --tiebreak=index --expect=ctrl-x,ctrl-v',
      \ 'down': '40%',
      \ 'sink*':    function('s:tags_sink'),
      \ }))
command! Buffers call fzf#run(fzf#wrap({
      \ 'source': filter(map(range(1, bufnr('$')), 'bufname(v:val)'), 'len(v:val)'),
      \ }))
command! MRU call fzf#run(fzf#wrap({
      \ 'source': v:oldfiles,
      \ }))

if executable('ag')
  set grepprg=ag\ --nogroup\ --nocolor
elseif executable('ack')
  set grepprg=ack\ --ignore-case\ --nocolor\ --nogroup\ ""\ %s
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
set timeoutlen=500

"" Searching config
set incsearch
set nohlsearch
set ignorecase
set smartcase

"" Color scheme config
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
set backspace=indent,eol,start
set autoread
set autowrite
set shortmess=aIT
set encoding=utf-8
scriptencoding utf-8
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
set t_md=
set hidden
set colorcolumn=100

"" Vim info config
set viminfo='500   " remember marks for last 500 files
set viminfo+=<1000 " remember up to 1000 lines in each register
set viminfo+=s1000 " remember up to 1MB in each register
set viminfo+=/1000 " remember last 1000 search patterns
set viminfo+=:1000 " remember last 1000 commands
set viminfo+=n$HOME/.vim/viminfo/info

"" Setting undo, backup, and swp directories
set undofile
set undodir=~/.vim/undo//
set backup
set backupdir=~/.vim/backup//
set directory=~/.vim/swp//

" Create necessary directories
if exists('*mkdir')
  for s:dir in [ '/.vim/backup', '/.vim/swp', '/.vim/undo', '/.vim/tags', '/.vim/viminfo' ]
    if !isdirectory($HOME.s:dir)
      call mkdir($HOME.s:dir, 'p')
    endif
  endfor
endif


""" Key bindings
"" Remap leader
let g:mapleader="\<Space>"

"" Regular j, k moves across visual lines
"" Numbered j, k moves across physical lines
nnoremap <expr> j v:count ? 'm'''.v:count.'j' : 'gj'
nnoremap <expr> k v:count ? 'm'''.v:count.'k' : 'gk'

"" Delete trailing whitespace
nnoremap <F6> :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar><CR>

"" Copy into clipboard
vnoremap <C-c> "+y

"" Easy split navigation
" nnoremap <C-j> <C-w>j
" nnoremap <C-k> <C-w>k
" nnoremap <C-l> <C-w>l
" nnoremap <C-h> <C-w>h

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

"" Digraph bindings
inoremap <C-n> <C-k>

"" Neocomplete bindings
inoremap <expr><C-j> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr><C-k> pumvisible() ? "\<C-p>" : "\<S-Tab>"

"" Sharing snippets
command! -range=% SP  <line1>,<line2>w !curl --form 'sprunge=<-' http://sprunge.us | tr --delete '\n' | xclip -in -selection clipboard
command! -range=% CL  <line1>,<line2>w !curl --form 'clbin=<-' https://clbin.com | tr --delete '\n' | xclip -in -selection clipboard
command! -range=% VP  <line1>,<line2>w !curl --form 'text=<-' http://vpaste.net | tr --delete '\n' | xclip -in -selection clipboard
command! -range=% IX  <line1>,<line2>w !curl --form 'f:1=<-' ix.io | tr --delete '\n' | xclip -in -selection clipboard
command! -range=% TB  <line1>,<line2>w !nc termbin.com 9999 | tr --delete '\n' | xclip -in -selection clipboard

"" Backspace to switch to alternate file
nnoremap <BS> <C-^>

"" Write with sudo
cmap w!! w !sudo tee > /dev/null %

""" Highlighting config
"" Underline current line
set nocursorline

function! Highlight() abort
  highlight Normal ctermbg=8
  highlight NonText ctermbg=8
  highlight LineNr ctermbg=0
  highlight VertSplit ctermbg=8
  highlight SignColumn ctermbg=0

  "" Highlighting for cursorline
  highlight clear CursorLine
  highlight CursorLine cterm=underline
  highlight CursorLineNR ctermfg=14 ctermbg=0

  "" Highlighting for GitGutter symbols
  highlight SignifySignAdd ctermfg=2 ctermbg=0
  highlight SignifySignChange ctermfg=3 ctermbg=0
  highlight SignifySignDelete ctermfg=1 ctermbg=0

  "" Highlighting for ALE symbols
  highlight ALEErrorSign ctermfg=1 ctermbg=0
  highlight ALEWarningSign ctermfg=3 ctermbg=0

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
  highlight markdownItalic ctermfg=4
  highlight markdownItalicDelimiter ctermfg=4
  highlight markdownBold ctermfg=4
  highlight markdownBoldDelimiter ctermfg=4
  highlight markdownBoldItalic ctermfg=4
  highlight markdownBoldItalicDelimiter ctermfg=4

  "" Highlighting for BufTabLine
  highlight BufTabLineCurrent cterm=none ctermfg=8 ctermbg=14
  highlight BufTabLineActive cterm=none ctermfg=8 ctermbg=10
  highlight BufTabLineHidden cterm=none ctermfg=8 ctermbg=10
  highlight BufTabLineFill ctermfg=0 ctermbg=0

  "" Highlighting for statusline
  highlight statusLineDark ctermfg=12 ctermbg=0
  highlight statusLineLight ctermfg=0 ctermbg=14
  highlight statusLineAccent ctermfg=15 ctermbg=1
endfunction


""" Autocommands
"" Quickfix related autocommands
augroup quickfix_group
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

"" Highlighting autocommands
call Highlight()
augroup highlighting_group
  autocmd!
  autocmd ColorScheme * call Highlight()
augroup end

"" Cursorline autocommands
augroup cursorline_group
  autocmd!
  autocmd WinLeave * set nocursorline
  autocmd WinEnter * set nocursorline
augroup END

"" Searching highlighting
augroup search_group
  autocmd!
  autocmd CmdlineEnter [/\?] set hlsearch
  autocmd CmdlineLeave [/\?] set nohlsearch
augroup END

"" Numbering autocommands
augroup numbering_group
  autocmd!
  autocmd WinLeave,BufLeave * set norelativenumber
  autocmd WinEnter,BufEnter * set relativenumber
augroup END
