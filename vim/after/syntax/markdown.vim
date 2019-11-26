syn region math start=/\$\$/ end=/\$\$/
syn match math '\$[^$]\_.\{-}\$'
highlight link math Statement
