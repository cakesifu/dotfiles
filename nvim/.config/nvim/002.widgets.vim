" Taboo ------------------------------------------------------------------"
let g:taboo_tab_format = " %N%m "
let g:taboo_renamed_tab_format = " %N %l%m "
let g:taboo_modified_tab_flag = " +"
let g:taboo_tabline = 1

" Airline ----------------------------------------------------------------"
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#tab_min_count = 2
let g:airline#extensions#tabline#tab_nr_type = 1
let g:airline#extensions#tabline#show_tab_type = 0
let g:airline#extensions#tabline#show_splits = 0
let g:airline#extensions#tabline#show_buffers = 0

let g:airline#extensions#taboo#enabled = 1
let g:airline#extensions#ale#enabled = 1

let g:airline_theme='base16_nord'
let g:airline_left_sep=''
let g:airline_right_sep=''


let g:airline#extensions#hunks#enabled = 0
let g:airline#extensions#branch#format = 0
let g:airline_section_y=''
let g:airline_section_z='%l/%L,%c'
let g:airline_section_b='%f'
let g:airline_section_c='%t %m%r'

" Lightline --------------------------------------------------------------"

let g:lightline = {
  \ 'colorscheme': 'solarized',
  \ 'active': {
  \   'left': [ [ 'mode', 'paste' ],
  \             [ 'readonly', 'path', 'modified' ] ],
  \   'right': [ [ 'lineno' ],
  \              [ 'fileencoding', 'filetype' ] ]
  \ },
  \ 'component': {
  \   'path': '%-.40f',
  \   'lineno': '(%L) %2l:%-2v',
  \   'test': 'tst'
  \ },
  \ }

let g:tsuquyomi_disable_quickfix = 1

" NERD -------------------------------------------------------------------"

let g:NERDSpaceDelims = 1
let g:NERDRemoveExtraSpaces = 1
let g:NERDTrimTrailingWhitespace = 1

let NERDTreeIgnore=['\.pyc$', '\.pyo$', '\.rbc$', '\.rbo$', '\.class$', '\.o$', '\~$']
let NERDTreeRespectWildIgnore=1

" ACK -------------------------------------------------------------------------"
if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif
