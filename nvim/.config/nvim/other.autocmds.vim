" Remove trailing whitespace ---------------------------------------------"
autocmd BufWritePre * :FixWhitespace

autocmd BufEnter * set colorcolumn=100
autocmd BufEnter *.[jt]sx? set colorcolumn=120
autocmd BufEnter * set sw=2 ts=2
autocmd BufEnter *.py set sw=4 ts=4

