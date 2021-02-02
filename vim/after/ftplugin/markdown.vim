" General config.
setlocal conceallevel=0
setlocal makeprg=pandoc\ --filter=pandoc-citeproc\ --pdf-engine=pdflatex\ --standalone\ --output=%:r.pdf\ %
setlocal omnifunc=htmlcomplete#CompleteTags
setlocal nocindent
setlocal textwidth=100
setlocal formatoptions+=t
setlocal formatoptions-=l
setlocal spell
if executable('prettier')
  setlocal formatprg=prettier\ --write\ --parser=markdown
endif

" Keybindings.
nnoremap <buffer> <leader>c :make!<CR>
nnoremap <buffer> <leader>e :!zathura %:p:r.pdf &<CR><CR>
