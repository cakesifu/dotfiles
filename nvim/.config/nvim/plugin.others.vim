" Taboo ------------------------------------------------------------------"
let g:taboo_tab_format = " %N%m "
let g:taboo_renamed_tab_format = " %N %l%m "
let g:taboo_modified_tab_flag = " +"
let g:taboo_tabline = 1


" ACK -------------------------------------------------------------------------"
if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif

" Ctrl-P ----------------------------------------------------------------------"
let g:ctrlp_custom_ignore = {
    \ 'dir':  '\v[\/]\.(git|hg|svn)$|node_modules',
    \ 'file': '\.pyc$\|\.pyo$\|\.rbc$|\.rbo$\|\.class$\|\.o$\|\~$\',
    \ }

