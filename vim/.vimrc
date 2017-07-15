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
"autocmd vimenter * NERDTree

" Ctrl + n to open NerdTree
map <C-n> :NERDTreeToggle<CR>

" Default NerdTreeTags open on startup
let g:nerdtree_tabs_open_on_console_startup=0

" Close vim when NERDTree is the only tab left
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

"" Config for YouCompleteMe
let g:ycm_complete_in_comments=0
let g:ycm_global_ycm_extra_conf='~/.ycm_extra_conf.py'
set shortmess+=c

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
  let g:ctrlp_user_command = 'ack "" %s -g --nocolor'
  let g:ctrlp_use_caching = 0
elseif executable('ag')
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
  let g:ctrlp_use_caching = 0
endif

"" Always have quickfix take entire bot
au Filetype qf wincmd J

"" Adjust quickfix window height to be 10 lines
au Filetype qf call AdjustWindowHeight(3, 10)
function! AdjustWindowHeight(minHeight, maxHeight)
  exe max([min([line("$"), a:maxHeight]), a:minHeight]) . "wincmd _"
endfunction

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

""" Key bindings
"" Remap leader
let mapleader="\<Space>"

"" Cpp bindings: compile, and compile and run
autocmd filetype cpp nnoremap <F4> :!g++ -std=c++14 % -o %:r <CR>
autocmd filetype cpp nnoremap <F5> :!g++ -std=c++14 % -o %:r && %:p:r<CR>

"" Latex bindings
autocmd filetype tex nmap <F3> <plug>(vimtex-compile)
autocmd filetype tex nmap <F4> <plug>(vimtex-errors)
autocmd filetype tex nmap <F5> <plug>(vimtex-view)

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

"" CtrlP bindings
nmap <leader>p :CtrlP<CR>
nmap <leader>b :CtrlPBuffer<CR>
nmap <leader>m :CtrlPMixed<CR>
nmap <leader>a :CtrlPMRU<CR>

""" Highlighting config
"" Underline current line
set cursorline
hi clear CursorLine
hi CursorLine gui=underline cterm=underline

"" Highlighting for transparent background
hi Normal guibg=none ctermbg=none
highlight NonText ctermbg=none

"" Custom highlighting for vimtex
highlight texMathMatcher ctermbg=none
highlight texMathZoneX ctermbg=none
highlight texRefLabel ctermbg=none
highlight texStatement ctermbg=none
