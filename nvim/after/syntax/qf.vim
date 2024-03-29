syntax match qfLineNr  "[^|]*" contained contains=qfError,qfWarning
syntax match qfError   "error" contained
syntax match qfWarning "warning" contained

highlight qfLineNr  ctermbg=none
highlight qfError   ctermfg=1
highlight qfWarning ctermfg=3
