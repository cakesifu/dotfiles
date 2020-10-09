
nmap <leader>gb :Gblame<CR>
nmap <leader>gs :Gstatus<CR>
nmap <leader>gd :Gdiff<CR>
nmap <leader>gl :Glog<CR>
nmap <leader>gc :Gcommit<CR>
nmap <leader>gp :Git push<CR>

" copy to global with \y and paste with \p
nmap <leader>yy "+yy
nmap <leader>y "+y
nmap <leader>p "+p
nmap <leader>P "+P

" format
" nmap <leader>f <Plug>(Prettier)
" nmap <leader>F :ALEFix<CR>

" show typescript type with \v and import with \i
" nmap <leader>v :TSType<CR>
" nmap <leader>i :TSGetCodeFix<CR>

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
