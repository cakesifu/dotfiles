call plug#begin('~/.nvim/plugged')

Plug 'scrooloose/nerdtree'
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/syntastic'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'morhetz/gruvbox'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'mxw/vim-jsx'
Plug 'pangloss/vim-javascript'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'easymotion/vim-easymotion'
Plug 'ervandew/supertab'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'ternjs/tern_for_vim', { 'do': 'npm install' } " requires npm install in dir
Plug 'carlitux/deoplete-ternjs', { 'do': 'npm install -g tern' }
Plug 'othree/jspc.vim', { 'for': ['javascript', 'javascript.jsx'] }
Plug 'gcmt/taboo.vim'
Plug 'SirVer/ultisnips'
Plug 'bronson/vim-trailing-whitespace'
Plug 'terryma/vim-multiple-cursors'
Plug 'editorconfig/editorconfig-vim'
Plug 'leafgarland/typescript-vim'
Plug 'wesQ3/vim-windowswap'
Plug 'Quramy/tsuquyomi', { 'for': ['typescript'] }
Plug 'Shougo/vimproc.vim', { 'do': 'make' }
Plug 'ap/vim-css-color'


" surround
" buffergator
" repeat
" gundo
" ack
" rainbow paranthesis
" css color
" jsx, jade, less
call plug#end()

" supertab
autocmd FileType javascript let g:SuperTabDefaultCompletionType = "<c-x><c-o>"
autocmd FileType typescript let g:SuperTabDefaultCompletionType = "<c-x><c-o>"
let g:SuperTabClosePreviewOnPopupClose = 1

" Deoplete --------------------------------------------------------------"

let g:deoplete#enable_at_startup = 1
 autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif
let g:deoplete#auto_complete_delay = 100

inoremap <silent><expr> <TAB>
\ pumvisible() ? "\<C-n>" :
\ <SID>check_back_space() ? "\<TAB>" :
\ deoplete#mappings#manual_complete()

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction

autocmd CmdwinEnter * let b:deoplete_sources = ['buffer']

let g:tern#command = ['tern']
let g:tern#arguments = ['--persistent']

" tern
if exists('g:plugs["tern_for_vim"]')
  let g:tern_show_argument_hints = 'on_hold'
  let g:tern_show_signature_in_pum = '1'
  autocmd FileType javascript setlocal omnifunc=tern#Complete
endif

autocmd FileType javascript nnoremap <silent> <buffer> gb :TernDef<CR>


" Remove trailing whitespace ---------------------------------------------"
autocmd BufWritePre * :FixWhitespace


" Taboo ------------------------------------------------------------------"
let g:taboo_tab_format = "%m "
let g:taboo_renamed_tab_format = "%l%m "
let g:taboo_modified_tab_flag = " +"
let g:taboo_tabline = 0


" Airline ----------------------------------------------------------------"
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#tab_min_count = 2
let g:airline#extensions#tabline#tab_nr_type = 1
let g:airline#extensions#tabline#show_tab_type = 0
let g:airline#extensions#tabline#show_splits = 0
let g:airline#extensions#tabline#show_buffers = 0
let g:airline_theme='gruvbox'
let g:airline_left_sep=''
let g:airline_right_sep=''


let g:airline#extensions#hunks#enabled = 0
let g:airline#extensions#branch#format = 2
let g:airline_section_y=''


let g:tsuquyomi_disable_quickfix = 1

" Syntastic -------------------------------------------------------------"
let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_typescript_checkers = ['tsuquyomi', 'tslint']
let g:syntastic_auto_loc_list = 0
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0
let g:syntastic_aggregate_errors = 1

let g:NERDSpaceDelims = 1
let g:NERDRemoveExtraSpaces = 1
let g:NERDTrimTrailingWhitespace = 1

set completeopt=longest,menuone
set wildignore=*.egg-info,*.pyc,node_modules,.git,.tern*
set list listchars=tab:›\ ,trail:·,extends:>,precedes:<
set noswapfile
set number nowrap cursorline incsearch ignorecase smartcase
set expandtab autoindent smarttab
set synmaxcol=200
autocmd BufEnter * set colorcolumn=100
autocmd BufEnter *.[jt]sx? set colorcolumn=120
autocmd BufEnter * set sw=2 ts=2
autocmd BufEnter *.py set sw=4 ts=4

set background=light
set termguicolors
colorscheme gruvbox

" gruvbox
" -----------------------------------------------------------------------------"
let g:gruvbox_improved_strings = 1
let g:gruvbox_italicize_comments = 1


" NERDTree
" -----------------------------------------------------------------------------"
let NERDTreeIgnore=['\.pyc$', '\.pyo$', '\.rbc$', '\.rbo$', '\.class$', '\.o$', '\~$']
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

let g:UltiSnipsSnippetDirectories=["custom-snippets"]

" typescript
let g:typescript_compiler_binary = 'tsc'
let g:typescript_compiler_options = ''

