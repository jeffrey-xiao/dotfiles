"" General config
setlocal conceallevel=0
setlocal makeprg=pandoc\ --pdf-engine=pdflatex\ --standalone\ --output=%:r.pdf\ %
setlocal omnifunc=htmlcomplete#CompleteTags
setlocal nocindent
setlocal formatoptions+=t
setlocal formatoptions-=l


"" Keybindings
nnoremap <buffer> <F5> :make<CR>
