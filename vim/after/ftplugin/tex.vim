"" General config
setlocal textwidth=100
setlocal spell


"" Highlight
highlight SpellBad cterm=underline


"" Keybindings
nmap <buffer> <F3> <plug>(vimtex-compile)
nmap <buffer> <F4> <plug>(vimtex-errors)
nmap <buffer> <F5> <plug>(vimtex-view)
