""" Functions
function! AdjustHeight(minHeight, maxHeight)
  exe max([min([line("$"), a:maxHeight]), a:minHeight])."wincmd _"
endfunction

let g:CXX="g++"
let g:CXX_FLAGS="-std=c++14"
function CompileCpp ()
  let l:fileName = expand('%')
  let l:baseName = expand('%:r')
  cex! system(g:CXX.' '.g:CXX_FLAGS.' '.l:fileName.' -o '.l:baseName)
  echo 'Finished compiling!'
  cw
endfunction

function RunCpp ()
  let l:filePath = expand('%:p:r')
  execute '!'.l:filePath
endfunction

""" Plugins
call plug#begin('~/.vim/plugged')

"" Color Scheme
Plug 'altercation/vim-colors-solarized'

"" Useful plugs
" Templates
Plug 'tibabit/vim-templates'

" Auto completion
Plug 'valloric/youcompleteme'

" Git integration
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'

" File explorer
Plug 'scrooloose/nerdtree'
Plug 'jistr/vim-nerdtree-tabs'
Plug 'majutsushi/tagbar'
Plug 'kien/ctrlp.vim'

" Auto brackets, indents and better comments
" Plug 'raimondi/delimitmate'
Plug 'yggdroot/indentline'
Plug 'tpope/vim-commentary'

" Status line
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Emmet
Plug 'mattn/emmet-vim'

"" Languages
Plug 'fatih/vim-go'
Plug 'neovimhaskell/haskell-vim'
Plug 'wlangstroth/vim-racket'
Plug 'guns/vim-clojure-static'
Plug 'digitaltoad/vim-jade'
Plug 'moll/vim-node'
Plug 'mxw/vim-jsx'
Plug 'pangloss/vim-javascript'
Plug 'jelera/vim-javascript-syntax'
Plug 'maksimr/vim-jsbeautify'
Plug 'jaawerth/nrun.vim'
Plug 'lervag/vimtex'
Plug 'octol/vim-cpp-enhanced-highlight'

call plug#end()


""" Config for plugins
"" Config for VimTemplates
let g:tmpl_search_paths=['~/.templates']
let g:tmpl_auto_initialize=0

"" Config for Nerdtree
"Autostart on vim startup
"au vimenter * NERDTree

" Ctrl + n to open NerdTree
map <C-n> :NERDTreeToggle<CR>

" Default NerdTreeTags open on startup
let g:nerdtree_tabs_open_on_console_startup=0

" Close vim when NERDTree is the only tab left
au bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

"" Config for YouCompleteMe
let g:ycm_complete_in_comments=0
let g:ycm_global_ycm_extra_conf='~/.ycm_extra_conf.py'

"" Config for the indentLine
let g:indentLine_color_term = 239
let g:indentLine_char='┊'
let g:indentLine_conceallevel = 0

"" Config for delimitMate
" Adds a new line before the autocompleted bracket
let g:delimitMate_autoclose = 1
let g:delimitMate_matchpairs = "(:),[:],{:},<:>"
let g:delimitMate_expand_space = 1
let g:delimitMate_expand_cr = 1
let g:delimitMate_expand_inside_quotes = 1

"" Config for airline
" Initialize dictionary for airline symbols
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif

" Unicode symbols
let g:airline_left_sep = '»'
let g:airline_left_sep = '▶'
let g:airline_right_sep = '«'
let g:airline_right_sep = '◀'
let g:airline_symbols.crypt = '🔒'
let g:airline_symbols.linenr = '␊'
let g:airline_symbols.linenr = '␤'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.maxlinenr = '☰'
let g:airline_symbols.maxlinenr = ''
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.paste = '∥'
let g:airline_symbols.spell = 'Ꞩ'
let g:airline_symbols.notexists = '∄'
let g:airline_symbols.whitespace ='Ξ'

" Powerline symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''

" Other airline config
let g:airline_theme='solarized'
let g:airline#extensions#tabline#enabled=1
let g:airline_section_z = airline#section#create(['windowswap', '', '%l%\/%L%', '\:%3v'])

"" Config for vimtex
let g:vimtex_compiler_latexmk = {'callback' : 0}
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


""" Key bindings
"" Remap leader
let g:mapleader="\<Space>"

nnoremap <expr> j v:count ? 'j' : 'gj'
nnoremap <expr> k v:count ? 'k' : 'gk'

"" Delete trailing whitespace
nnoremap <F6> :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar><CR>

"" Toggle tagbar
nmap <F7> :TagbarToggle<CR>

"" Copy into clipboard
vnoremap <C-c> "+y

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

  au Filetype qf nnoremap <Leader>. :cn<CR>
  au Filetype qf nnoremap <Leader>, :cp<CR>
augroup END

"" cpp related autocommands
augroup cpp_group
  au Filetype cpp nnoremap <buffer> <F4> :call CompileCpp()<CR>
  au Filetype cpp nnoremap <buffer> <F5> :call RunCpp()<CR>
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
