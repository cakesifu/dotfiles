call plug#begin('~/.nvim/plugged')

Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'Shougo/denite.nvim'
Plug 'Shougo/echodoc.vim'
Plug 'scrooloose/nerdtree'
Plug 'scrooloose/nerdcommenter'
Plug 'w0rp/ale'
Plug 'itchyny/lightline.vim'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'pangloss/vim-javascript'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'easymotion/vim-easymotion'
Plug 'othree/jspc.vim'
Plug 'gcmt/taboo.vim'
Plug 'SirVer/ultisnips'
Plug 'bronson/vim-trailing-whitespace'
Plug 'terryma/vim-multiple-cursors'
Plug 'editorconfig/editorconfig-vim'
Plug 'wesQ3/vim-windowswap'
Plug 'ap/vim-css-color', { 'for': ['css', 'scss', 'sass', 'less'] }
Plug 'jeetsukumaran/vim-buffergator'
Plug 'mileszs/ack.vim'
" Typescript
" Plug 'Quramy/tsuquyomi'
" Plug 'leafgarland/typescript-vim'
Plug 'HerringtonDarkholme/yats.vim'
" Plug 'ianks/vim-tsx'
Plug 'mhartington/nvim-typescript', {'do': ':!install.sh \| :UpdateRemotePlugins'}
Plug 'jparise/vim-graphql'
" Colorthemes
" Plug 'morhetz/gruvbox'
Plug 'iCyMind/NeoSolarized'
Plug 'ncm2/float-preview.nvim'

call plug#end()

" Deoplete --------------------------------------------------------------"

let g:deoplete#enable_at_startup = 1
autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif
" call deoplete#custom#option('auto_complete', v:false)
call deoplete#custom#option('auto_complete_delay', 300)
call deoplete#custom#option('max_list', 25)
call deoplete#custom#option('min_pattern_length', 3)
call deoplete#custom#option('on_insert_enter', v:false)

function g:Multiple_cursors_before()
  call deoplete#custom#buffer_option('auto_complete', v:false)
endfunction
function g:Multiple_cursors_after()
  call deoplete#custom#buffer_option('auto_complete', v:true)
endfunction

let g:echodoc#enable_at_startup = 1

" Remove trailing whitespace ---------------------------------------------"
autocmd BufWritePre * :FixWhitespace


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

" p:ale ----------------------------------------------------------------"

let g:ale_linters = {
\   'javascript': ['eslint'],
\   'typescript': ['tslint', 'tsserver', 'typecheck'],
\}
let g:ale_fixers = {
\   'javascript': ['eslint'],
\   'typescript': ['tslint'],
\}
let g:ale_sign_error = '●'
let g:ale_sign_warning = '.'
let g:ale_lint_on_enter = 0
let g:ale_lint_delay = 2000
let g:ale_lint_on_text_changed = 'never'
let g:ale_lint_on_insert_leave = 1
let g:ale_echo_msg_format = '[%linter%:%severity%] %s'

nmap <leader>f :ALEFix<CR>
map <F8> <Plug>(ale_fix)

" Others ----------------------------------------------------------------"

let g:NERDSpaceDelims = 1
let g:NERDRemoveExtraSpaces = 1
let g:NERDTrimTrailingWhitespace = 1

set completeopt=longest,menuone
set wildignore=*.egg-info,*.pyc,node_modules,.git,.tern*,Session.vim,build
set list listchars=tab:›\ ,trail:·,extends:>,precedes:<
set noswapfile
set number nowrap cursorline incsearch ignorecase smartcase
set expandtab autoindent smarttab
set synmaxcol=200
autocmd BufEnter * set colorcolumn=100
autocmd BufEnter *.[jt]sx? set colorcolumn=120
autocmd BufEnter * set sw=2 ts=2
autocmd BufEnter *.py set sw=4 ts=4
" make :W the same as :w sick of this happening
command W w

" Set cursor color and shape
" highlight Cursor guifg=white guibg=black
" highlight iCursor guifg=#dc322f guibg=steelblue
highlight Cursor gui=reverse guifg=reverse guibg=reverse
highlight iCursor gui=reverse guifg=NONE guibg=NONE

set guifont=Fira\ Code:h11
set guicursor=a:block-Cursor
set guicursor+=i:ver25-iCursor
set guicursor+=a:blinkon250-blinkoff100
set mouse=a

" NERDTree
" -----------------------------------------------------------------------------"
let NERDTreeIgnore=['\.pyc$', '\.pyo$', '\.rbc$', '\.rbo$', '\.class$', '\.o$', '\~$']
let NERDTreeRespectWildIgnore=1
map <leader>n :NERDTreeToggle<CR>:NERDTreeMirror<CR>
map <leader>N :NERDTreeFind<CR>


" fugitive
" -----------------------------------------------------------------------------"
nmap <leader>gb :Gblame<CR>
nmap <leader>gs :Gstatus<CR>
nmap <leader>gd :Gdiff<CR>
nmap <leader>gl :Glog<CR>
nmap <leader>gc :Gcommit<CR>
nmap <leader>gp :Git push<CR>

let g:ctrlp_custom_ignore = {
    \ 'dir':  '\v[\/]\.(git|hg|svn)$|bower_components|node_modules',
    \ 'file': '\.pyc$\|\.pyo$\|\.rbc$|\.rbo$\|\.class$\|\.o$\|\~$\',
    \ }

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

let g:UltiSnipsSnippetDirectories=["custom-snippets"]

" typescript
" -----------------------------------------------------------------------------"
let g:typescript_compiler_binary = 'tsc'
let g:typescript_compiler_options = ''

" colorscheme
" -----------------------------------------------------------------------------"
set termguicolors
colorscheme NeoSolarized
set background=light
let g:neosolarized_bold = 1
let g:neosolarized_underline = 1
let g:neosolarized_italic = 1

" session
" -----------------------------------------------------------------------------"
set sessionoptions+=tabpages,globals

" show syntax highlight group for word under cursor
function! SynStack()
  if !exists("*synstack")
    return
  endif
  echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunc


" ack
" -----------------------------------------------------------------------------"
if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif
