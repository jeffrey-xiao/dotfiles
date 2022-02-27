" General config.
setlocal omnifunc=htmlcomplete#CompleteTags
if executable('prettier')
  setlocal formatprg=prettier\ --write\ --parser=html
endif
