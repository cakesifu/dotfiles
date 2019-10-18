nmap <leader>f :ALEFix<CR>
map <F8> <Plug>(ale_fix)

map <leader>n :NERDTreeToggle<CR>:NERDTreeMirror<CR>
map <leader>N :NERDTreeFind<CR>

nmap <leader>gb :Gblame<CR>
nmap <leader>gs :Gstatus<CR>
nmap <leader>gd :Gdiff<CR>
nmap <leader>gl :Glog<CR>
nmap <leader>gc :Gcommit<CR>
nmap <leader>gp :Git push<CR>

" fix delete key for sta  dsf
map <F1> <del>
map! <F1> <del>

" toggle hlsearch with \hs
nmap <leader>hs :set hlsearch! hlsearch?<CR>

" search selected with //
vnoremap <expr> // 'y/\V'.escape(@",'\').'<CR>'

" copy current file to clipboard
function! CopyFilePathToClipboard()
  let @+=expand("%")
endfunc

nmap <leader>cp :call CopyFilePathToClipboard()<CR>


" make :W the same as :w sick of this happening
command W w
command Q q
