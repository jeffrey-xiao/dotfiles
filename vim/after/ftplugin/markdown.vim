"" General config
setlocal conceallevel=0
setlocal makeprg=pandoc\ --pdf-engine=pdflatex\ --standalone\ --output=%:r.pdf\ %
setlocal omnifunc=htmlcomplete#CompleteTags
setlocal nocindent
setlocal textwidth=100
setlocal formatoptions+=t
setlocal formatoptions-=l
setlocal spell


"" Highlight
highlight SpellBad cterm=underline


"" Keybindings
nnoremap <buffer> <F4> :make<CR>
nnoremap <buffer> <F5> :!zathura %:p:r.pdf &<CR><CR>
