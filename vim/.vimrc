if !exists("g:syntax_on")
  syntax enable
endif


""" Functions
function! AdjustHeight(minHeight, maxHeight)
  exe max([min([line("$"), a:maxHeight]), a:minHeight])."wincmd _"
endfunction

let g:CXX="g++"
let g:CXX_FLAGS="-std=c++14 -g -Wall -Wextra -fsanitize=undefined,address"
function! CompileCpp ()
  let l:fileName = expand('%')
  let l:baseName = expand('%:r')
  cex! system(g:CXX.' '.g:CXX_FLAGS.' '.l:fileName.' -o '.l:baseName)
  echo 'Finished compiling!'
  cw
endfunction

function! RunCpp ()
  let l:filePath = expand('%:p:r')
  execute '!'.l:filePath
endfunction


""" Plugins
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

"" Templates
Plug 'tibabit/vim-templates'

"" Auto completion, linting, and better highlighting
Plug 'Shougo/neocomplete.vim'
Plug 'Shougo/neoinclude.vim'

Plug 'ternjs/tern_for_vim'
Plug 'davidhalter/jedi-vim'
Plug 'Rip-Rip/clang_complete'
Plug 'lervag/vimtex'

Plug 'w0rp/ale'
Plug 'sheerun/vim-polyglot'

"" Git integration
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'

"" File explorer
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'justinmk/vim-dirvish'

"" Tags
Plug 'ludovicchabant/vim-gutentags'

"" Status line
Plug 'itchyny/lightline.vim'
Plug 'mgee/lightline-bufferline'

"" Languages
Plug 'moll/vim-node'
Plug 'pangloss/vim-javascript'
Plug 'jelera/vim-javascript-syntax'
Plug 'mxw/vim-jsx'
Plug 'octol/vim-cpp-enhanced-highlight'
Plug 'hkmix/vim-george'
" Plug 'jaawerth/nrun.vim'
" Plug 'fatih/vim-go'
" Plug 'mattn/emmet-vim'
" Plug 'maksimr/vim-jsbeautify'
" Plug 'wlangstroth/vim-racket'
" Plug 'guns/vim-clojure-static'
" Plug 'digitaltoad/vim-jade'

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

" Config for jedi
let g:jedi#completions_enabled = 0
let g:jedi#auto_vim_configuration = 0
let g:jedi#smart_auto_mappings = 0

" Config for neocomplete
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
let g:neocomplete#sources#omni#input_patterns.tex =
        \ '\v\\%('
        \ . '\a*%(ref|cite)\a*%(\s*\[[^]]*\])?\s*\{[^{}]*'
        \ . '|includegraphics%(\s*\[[^]]*\])?\s*\{[^{}]*'
        \ . '|%(include|input)\s*\{[^{}]*'
        \ . ')'

augroup neocomplete_group
  au!
  au FileType python setlocal omnifunc=jedi#completions
  au FileType javascript setlocal omnifunc=tern#Complete
  au FileType css setlocal omnifunc=csscomplete#CompleteCSS
  au FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
  au FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
augroup END

"" Config for Ale
let g:ale_linters = {
      \ 'javascript': [ 'eslint' ],
      \ 'python': [ 'autopep', 'flake8', 'pylint' ],
      \ 'cpp': [ 'gcc', 'clang' ],
      \}

let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
let g:ale_set_quickfix = 1

"" Config for VimTemplates
let g:tmpl_search_paths=['~/.templates']
let g:tmpl_auto_initialize=0

"" Config for Dirvish
let g:dirvish_mode = ':sort ,^.*[\/],'
augroup dirvish_group
  au!
  au FileType dirvish nnoremap <buffer> zh :g@\v/\.[^\/]+/?$@d<CR>
augroup END

"" Config for Gutentags
let g:gutentags_cache_dir='~/.tags'
let g:gutentags_generate_on_empty_buffer=1

"" Config for IndentLine
let g:indentLine_color_term = 239
let g:indentLine_char='┊'

"" Config for delimitMate
" Adds a new line before the autocompleted bracket
let g:delimitMate_autoclose = 1
let g:delimitMate_expand_space = 1
let g:delimitMate_expand_cr = 1
let g:delimitMate_matchpairs = "(:),[:],{:}"

"" Config for lightline
let g:lightline = {
      \ 'colorscheme': 'flattened_dark',
      \ 'active': {
      \   'left': [
      \     [ 'mode', 'paste' ],
      \     [ 'readonly', 'filename' ],
      \     [ 'gitbranch', 'gitinfo' ],
      \   ],
      \   'right': [
      \     [ 'warnings' ],
      \     [ 'lineinfo' ],
      \     [ 'fileformat', 'fileencoding', 'filetype' ],
      \   ],
      \ },
      \ 'tabline': {
      \   'left': [ [ 'tabs', 'buffers' ] ],
      \   'right': [ [ 'close' ] ],
      \ },
      \ 'tab': {
      \   'active': [ 'tabnum' ],
      \   'inactive': [ 'tabnum' ],
      \ },
      \ 'enable': {
      \   'statusline': 1,
      \   'tabline': 1,
      \ },
      \ 'component_expand': {
      \   'buffers': 'lightline#bufferline#buffers',
      \ },
      \ 'component_type': {
      \   'buffers': 'tabsel',
      \ },
      \ 'component': {
      \   'lineinfo': '%l/%L:%3v',
      \ },
      \ 'component_function': {
      \   'gitbranch': 'fugitive#head',
      \   'gitinfo': 'LightLineGitInfo',
      \   'warnings': 'LightLineWarnings',
      \ },
      \ }

function! LightLineGitInfo()
  if fugitive#head() != ""
    let info = GitGutterGetHunkSummary()
    return "+".info[0]." ~".info[1]." -".info[2]
  else
    return ""
  endif
endfunction

autocmd cursorhold,bufwritepost * unlet! b:warning_flags
function! LightLineWarnings()
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
  endif

  return b:warning_flags
endfunction

"" Config for vimtex
let g:vimtex_compiler_latexmk = {'callback' : 0}
let g:latex_view_general_viewer = "zathura"
let g:vimtex_view_method = "zathura"
let g:tex_conceal = ""

"" Config for fzf
function! s:tags_sink(lines)
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
        \ 'sink*':    function('s:tags_sink'),
        \ }))
command! Buffers call fzf#run(fzf#wrap({
      \ 'source': map(range(1, bufnr('$')), 'bufname(v:val)'),
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

"" Line/column numberS
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

"" Other config
set wildmenu
set wildmode=full
set wildignore+=.hg,.git,.svn                    " Version control
set wildignore+=*.aux,*.out,*.toc                " LaTeX intermediate files
set wildignore+=*.jpg,*.bmp,*.gif,*.png,*.jpeg   " binary images
set wildignore+=*.o,*.obj,*.exe,*.dll,*.manifest " compiled object files
set wildignore+=*.sw?                            " Vim swap files
set wildignore+=*.DS_Store                       " OSX garbage
set conceallevel=0
set backspace=2
set autoread
set autowrite
set shortmess+=c
set encoding=utf-8
set lazyredraw
set showtabline=2
set undofile
set undodir=~/.vim/.undo//
set backupdir=~/.vim/.backup//
set directory=~/.vim/.swp//


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

"" Reload .vimrc
map <leader>rr :source ~/.vimrc<CR>

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
nmap <leader>b :Buffers<CR>
nmap <leader>p :FZF<CR>
nmap <leader>m :MRU<CR>
nmap <leader>t :Tags<CR>

"" Grep for word under cursor
nnoremap K :execute 'grep!"\b"'.expand('<cword>').'"\b"'<CR>:cw<CR>

"" Consistent behavior
nmap Y y$

"" Sudoedit a file
cmap w!! %!sudo tee > /dev/null %

"" Neocompleter bindings
inoremap <expr><Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr><S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"


""" Highlighting config
"" Underline current line
set cursorline
hi clear CursorLine
hi CursorLine cterm=underline

"" Highlighting for transparent background
hi Normal ctermbg=none
hi NonText ctermbg=none
hi LineNr ctermbg=none
hi VertSplit ctermbg=none

"" Highlighting for GitGutter symbols
hi clear SignColumn


""" Autocommands
"" Quick fix related autocommands
augroup quick_fix_group
  au!
  "" Always have quickfix take entire bot
  au Filetype qf wincmd J

  "" Adjust quickfix window height to be 10 lines
  au Filetype qf call AdjustHeight(3, 10)

  "" Convenient quickfix macros
  " Open in new tab
  au Filetype qf nnoremap <buffer> t <C-W><CR><C-W>T
  " Open in new tab and focus on results
  au Filetype qf nnoremap <buffer> <Leader>t <C-W><CR><C-W>TgT<C-W>p
  " Open
  au Filetype qf nnoremap <buffer> o <CR>
  " Open and focus on results
  au Filetype qf nnoremap <buffer> <Leader>o <CR><C-W>b
  " Open in vertical split
  au Filetype qf nnoremap <buffer> v <C-W><CR><C-W>H<C-W>b<C-W>J:call AdjustHeight(3, 10)<CR><C-W>t
  " Open in vertical split and focus on results
  au Filetype qf nnoremap <buffer> <Leader>v <C-W><CR><C-W>H<C-W>b<C-W>J:call AdjustHeight(3, 10)<CR>
  " Open in horizontal split
  au Filetype qf nnoremap <buffer> h <C-W><CR><C-W>K
  " Open in horizontal split and focus on results
  au Filetype qf nnoremap <buffer> <Leader>h <C-W><CR><C-W>K<C-W>b
  " Quit
  au Filetype qf nnoremap <buffer> q :ccl<CR>
augroup END

"" cpp related autocommands
augroup cpp_group
  au!
  au Filetype cpp nnoremap <buffer> <F4> :call CompileCpp()<CR>
  au Filetype cpp nnoremap <buffer> <F5> :call RunCpp()<CR>
augroup END

"" latex related autocommands
augroup latex_group
  au!
  au Filetype tex nmap <buffer> <F3> <plug>(vimtex-compile)
  au Filetype tex nmap <buffer> <F4> <plug>(vimtex-errors)
  au Filetype tex nmap <buffer> <F5> <plug>(vimtex-view)
  au Filetype tex hi texMathMatcher ctermbg=none
  au Filetype tex hi texMathZoneX ctermbg=none
  au Filetype tex hi texRefLabel ctermbg=none
  au Filetype tex hi texStatement ctermbg=none
augroup END

augroup markdown_group
  au!
  au Filetype markdown hi def link markdownItalic NONE
  au Filetype markdown hi def link markdownItalicDelimiter NONE
  au Filetype markdown hi def link markdownBold NONE
  au Filetype markdown hi def link markdownBoldDelimiter NONE
  au Filetype markdown hi def link markdownBoldItalic NONE
  au Filetype markdown hi def link markdownBoldItalicDelimiter NONE
augroup END

augroup java_group
  au!
  au Filetype java nnoremap <buffer> <F4> :!javac %<CR>
  au Filetype java nnoremap <buffer> <F5> :!java %:r<CR>
augroup END
