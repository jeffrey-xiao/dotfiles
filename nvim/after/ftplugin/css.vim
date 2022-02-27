" General config.
setlocal omnifunc=csscomplete#CompleteCSS
if executable('prettier')
  setlocal formatprg=prettier\ --write\ --parser=css
endif
