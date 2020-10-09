let g:NERDSpaceDelims = 1
let g:NERDRemoveExtraSpaces = 1
let g:NERDTrimTrailingWhitespace = 1

let NERDTreeIgnore=['\.pyc$', '\.pyo$', '\.rbc$', '\.rbo$', '\.class$', '\.o$', '\~$']
let NERDTreeRespectWildIgnore=1

map <leader>n :call OpenNerd()<CR>
map <leader>N :call SyncTree()<CR>

function! OpenNerd()
  if IsNERDTreeOpen()
    NERDTreeToggleVCS
  else
    NERDTreeToggleVCS
    wincmd p
  endif
endfunction

function! IsNERDTreeOpen()
  return exists("t:NERDTreeBufName") && (bufwinnr(t:NERDTreeBufName) != -1)
endfunction

" Call NERDTreeFind iff NERDTree is active, current window contains a modifiable
" file, and we're not in vimdiff
" Sync nerdtree ---------------------------------------------"
function! SyncTree()
  if !IsNERDTreeOpen()
    NERDTreeVCS
    wincmd p
  endif

  if &modifiable && strlen(expand('%')) > 0 && !&diff
    NERDTreeFind
    wincmd p
  endif
endfunction

" Highlight currently open buffer in NERDTree
" autocmd BufEnter * call SyncTree()

