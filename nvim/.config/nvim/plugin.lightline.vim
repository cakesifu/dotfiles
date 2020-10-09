" Lightline --------------------------------------------------------------"

let g:lightline = {
  \ 'colorscheme': 'solarized',
  \ 'active': {
  \   'left': [ [ 'mode', 'paste' ],
  \             [ 'cocstatus', 'readonly', 'path', 'modified' ] ],
  \   'right': [ [ 'lineno' ],
  \              [ 'fileencoding', 'filetype' ] ]
  \ },
  \ 'inactive': {
    \  'left': [ ['path']],
    \  'right': [['lineno'], ['fileencoding', 'filetype']],
  \ },
  \ 'component_function': {
    \ 'cocstatus': 'coc#status',
    \ 'fileencoding': 'LightlineFileencoding',
    \ 'filetype': 'LightlineFiletype',
    \ 'mode': 'LightlineMode',
  \ },
  \ 'component': {
    \ 'path': '%<%-.100f',
    \ 'lineno': '%2l:%-2v%<%L'
  \ },
\ }

let g:lightline.mode_map = {
\ 'n': 'N',
\ 'i': 'I',
\ 'r': 'R',
\ 'v': 'V',
\ }

function! LightlineMode()
  let fname = expand('%:t')
  return fname =~# '^__Tagbar__' ? 'Tagbar' :
        \ fname ==# 'ControlP' ? 'CtrlP' :
        \ fname =~# 'NERD_tree' ? 'NERDTree' :
        \ lightline#mode()
endfunction

function! LightlineFileencoding()
  return winwidth(0) > 80 ? (&fenc !=# '' ? &fenc : &enc) : ''
endfunction

function! LightlineFiletype()
  return winwidth(0) > 80 ? (&filetype !=# '' ? &filetype : 'no ft') : ''
endfunction

