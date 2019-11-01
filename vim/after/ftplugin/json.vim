" General config.
setlocal conceallevel=0
if executable('prettier')
  setlocal formatprg=prettier\ --write\ --parser=json
endif
