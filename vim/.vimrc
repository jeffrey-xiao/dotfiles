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

