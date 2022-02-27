syntax region math start=/\$\$/ end=/\$\$/
syntax match math '\$[^$]\_.\{-}\$'

highlight link math Statement
