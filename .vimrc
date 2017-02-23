set tabstop=2
set shiftwidth=2
set autoindent
set smartindent
set cindent
set number
set noerrorbells
set novisualbell
set t_vb=
set tm=500

set hlsearch
syntax enable

autocmd filetype cpp nnoremap <F4> :!g++ -std=c++11  % -o %:r <CR>
autocmd filetype cpp nnoremap <F5> :!g++ -std=c++11  % -o %:r && ./%:r < ~/Documents/data/in.txt > ~/Documents/data/out.txt <CR>

