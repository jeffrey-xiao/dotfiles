call plug#begin('~/.vim/plugged')

" Color Scheme
Plug 'altercation/vim-colors-solarized'

" Useful plugs
Plug 'valloric/youcompleteme'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
Plug 'scrooloose/nerdtree'
Plug 'jistr/vim-nerdtree-tabs'
Plug 'kien/ctrlp.vim'
Plug 'raimondi/delimitmate'
Plug 'yggdroot/indentline' " Need to configure
Plug 'tpope/vim-commentary'

" Languages
Plug 'fatih/vim-go'
Plug 'mattn/emmet-vim'
Plug 'octol/vim-cpp-enhanced-highlight'
Plug 'neovimhaskell/haskell-vim'
Plug 'guns/vim-clojure-static'
Plug 'wlangstroth/vim-racket'
Plug 'digitaltoad/vim-jade'
Plug 'moll/vim-node'
Plug 'mxw/vim-jsx'
Plug 'pangloss/vim-javascript'

" Javascript
Plug 'jelera/vim-javascript-syntax'
Plug 'maksimr/vim-jsbeautify'
Plug 'jaawerth/nrun.vim'

call plug#end()

" Config for Nerdtree
autocmd vimenter * NERDTree

" Ctrl + n to open NerdTree
map <C-n> :NERDTreeToggle<CR>

" Default NerdTreeTags open on startup
let g:nerdtree_tabs_open_on_console_startup=1

" Config for YouCompleteMe
let g:ycm_complete_in_comments=0
let g:ycm_global_ycm_extra_conf='~/.ycm_extra_conf.py'

" Close vim when NERDTree is the only tab left
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

let g:indentLine_color_term = 239
let g:indentLine_char='│'

let g:delimitMate_expand_cr=1

set nocompatible
set t_Co=256
set tabstop=2
set shiftwidth=2
set expandtab
set autoindent
set smartindent
set cindent
set nowrap
set number
set noerrorbells
set novisualbell
set t_vb=
set tm=500

set nohlsearch
set incsearch
set ignorecase
set ruler

syntax enable
set background=dark
silent! colorscheme solarized

autocmd filetype cpp nnoremap <F4> :!g++ -std=c++11  % -o %:r <CR>
autocmd filetype cpp nnoremap <F5> :!g++ -std=c++11  % -o %:r && ./%:r<CR>

