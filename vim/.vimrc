""" Functions
function! AdjustHeight(minHeight, maxHeight)
  exe max([min([line("$"), a:maxHeight]), a:minHeight])."wincmd _"
endfunction

let g:CXX="g++"
let g:CXX_FLAGS="-std=c++14"
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
Plug 'altercation/vim-colors-solarized'

"" Useful plugs
Plug 'tpope/vim-unimpaired'

" Templates
Plug 'tibabit/vim-templates'

" Auto completion
Plug 'valloric/youcompleteme'

" Git integration
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'

" File explorer
Plug 'kien/ctrlp.vim'
Plug 'justinmk/vim-dirvish'

" Tags
Plug 'ludovicchabant/vim-gutentags'

" Auto brackets, indents and better comments
Plug 'raimondi/delimitmate'
Plug 'yggdroot/indentline'
Plug 'tpope/vim-commentary'

" Status line
Plug 'itchyny/lightline.vim'
Plug 'mgee/lightline-bufferline'

" Improves quick fix window
Plug 'romainl/vim-qf'

"" Languages
Plug 'fatih/vim-go'

Plug 'moll/vim-node'
Plug 'jaawerth/nrun.vim'

Plug 'mattn/emmet-vim'

Plug 'pangloss/vim-javascript'
Plug 'jelera/vim-javascript-syntax'
Plug 'maksimr/vim-jsbeautify'
Plug 'mxw/vim-jsx'

Plug 'octol/vim-cpp-enhanced-highlight'

Plug 'lervag/vimtex'

" Plug 'wlangstroth/vim-racket'

" Plug 'guns/vim-clojure-static'

" Plug 'digitaltoad/vim-jade'

call plug#end()


""" Config for plugins
"" Config for VimTemplates
let g:tmpl_search_paths=['~/.templates']
let g:tmpl_auto_initialize=0

"" Config for Dirvish
let g:dirvish_mode = ':sort ,^.*[\/],'

"" Config for Gutentags
let g:gutentags_cache_dir='~/.tags'
let g:gutentags_generate_on_empty_buffer=1

"" Config for YouCompleteMe
let g:ycm_complete_in_comments=0
let g:ycm_global_ycm_extra_conf='~/.ycm_extra_conf.py'

"" Config for IndentLine
let g:indentLine_color_term = 239
let g:indentLine_char='┊'

"" Config for delimitMate
" Adds a new line before the autocompleted bracket
let g:delimitMate_autoclose = 1
let g:delimitMate_matchpairs = "(:),[:],{:},<:>"
let g:delimitMate_expand_space = 1
let g:delimitMate_expand_cr = 1
let g:delimitMate_expand_inside_quotes = 1

"" Config for lightline
let g:lightline = {
      \ 'colorscheme': 'solarized',
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

"" Config for ctrlp
let g:ctrlp_cmd = 'CtrlPBuffer'
let g:ctrlp_show_hidden = 1

if executable('ack')
  set grepprg=ack\ -i\ --nocolor\ --nogroup\ ""\ %s
  let g:ctrlp_user_command = 'ack "" %s -g --nocolor'
  let g:ctrlp_use_caching = 0
elseif executable('ag')
  set grepprg=ag\ --nogroup\ --nocolor
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
  let g:ctrlp_use_caching = 0
endif


""" General config
"" Indentation
set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab
set autoindent
set smartindent
set smarttab
set cindent
set nowrap

"" Line/column numbers
set number
set relativenumber
set ruler
set laststatus=2

"" No beeping or error sounds
set noerrorbells
set novisualbell
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
syntax enable
silent! colorscheme solarized

"" Other config
set nocompatible
set wildmenu
set conceallevel=0
set backspace=2
set autoread
set shortmess+=c
set encoding=utf-8
set undodir=~/.vim/.undo//
set backupdir=~/.vim/.backup//
set directory=~/.vim/.swp//
set lazyredraw
set showtabline=2


""" Key bindings
"" Remap leader
let g:mapleader="\<Space>"

"" Regular j, k moves across visual lines
"" Numbered j, k moves across physical lines
nnoremap <expr> j v:count ? 'j' : 'gj'
nnoremap <expr> k v:count ? 'k' : 'gk'

"" Reload .vimrc
map rr :source ~/.vimrc<CR>

"" Delete trailing whitespace
nnoremap <F6> :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar><CR>

"" Toggle tagbar
nmap <F7> :TagbarToggle<CR>

"" Copy into clipboard
vnoremap <C-c> "+y
nnoremap <C-v> "+v

"" Easy split navigation
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
nnoremap <C-h> <C-w>h

set splitbelow
set splitright

"" CtrlP bindings
nmap <leader>p :CtrlP<CR>
nmap <leader>b :CtrlPBuffer<CR>
nmap <leader>m :CtrlPMixed<CR>
nmap <leader>a :CtrlPMRU<CR>
nmap <leader>t :CtrlPTag<CR>

"" Dirvish bindings
nmap <leader>y :Dirvish<CR>

"" Grep for word under cursor
nnoremap K :execute 'grep!"\b"'.expand('<cword>').'"\b"'<CR>:cw<CR>


""" Highlighting config
"" Underline current line
set cursorline
hi clear CursorLine
hi CursorLine cterm=underline

"" Highlighting for transparent background
hi Normal ctermbg=none
hi NonText ctermbg=none
hi LineNr ctermbg=none
hi SignColumn ctermbg=none
hi VertSplit ctermbg=none

"" Custom highlighting for vimtex
hi texMathMatcher ctermbg=none
hi texMathZoneX ctermbg=none
hi texRefLabel ctermbg=none
hi texStatement ctermbg=none

"" Highlighting for GitGutter symbols
highlight clear SignColumn


""" Autocommands
"" Quick fix related autocommands
augroup quick_fix_group
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
  au Filetype cpp nnoremap <buffer> <F4> :call CompileCpp()<CR>
  au Filetype cpp nnoremap <buffer> <F5> :call RunCpp()<CR>
  let g:delimitMate_matchpairs = "(:),[:],{:}"
augroup END

"" latex related autocommands
augroup latex_group
  au Filetype tex nmap <buffer> <F3> <plug>(vimtex-compile)
  au Filetype tex nmap <buffer> <F4> <plug>(vimtex-errors)
  au Filetype tex nmap <buffer> <F5> <plug>(vimtex-view)
augroup END

augroup markdown_group
  au Filetype markdown hi def link markdownItalic NONE
  au Filetype markdown hi def link markdownItalicDelimiter NONE
  au Filetype markdown hi def link markdownBold NONE
  au Filetype markdown hi def link markdownBoldDelimiter NONE
  au Filetype markdown hi def link markdownBoldItalic NONE
  au Filetype markdown hi def link markdownBoldItalicDelimiter NONE
augroup END
