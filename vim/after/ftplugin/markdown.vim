"" General config
setlocal conceallevel=0
setlocal makeprg=pandoc\ -s\ -o\ %:r.pdf\ %
setlocal omnifunc=htmlcomplete#CompleteTags


"" Keybindings
nnoremap <buffer> <F5> :make<CR>
