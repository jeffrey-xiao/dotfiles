call plug#begin('~/.vim/plugged')

" Color Scheme
Plug 'altercation/vim-colors-solarized'

" Useful plugs
Plug 'valloric/youcompleteme'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
Plug 'scrooloose/nerdtree'
Plug 'jistr/vim-nerdtree-tabs'

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

" Close vim when NERDTree is the only tab left
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

set nocompatible
set t_Co=256
set tabstop=2
set shiftwidth=2
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
colorscheme solarized

autocmd filetype cpp nnoremap <F4> :!g++ -std=c++11  % -o %:r <CR>
autocmd filetype cpp nnoremap <F5> :!g++ -std=c++11  % -o %:r && ./%:r<CR>

