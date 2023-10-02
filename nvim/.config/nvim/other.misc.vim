" Disable safe write
" -------------------------------------
set nobackup
set nowritebackup
set hidden

" Other
" -------------------------------------
set wildignore=*.egg-info,*.pyc,node_modules,.git,.tern*,Session.vim,.next
set list listchars=tab:›\ ,trail:·,extends:>,precedes:<
set noswapfile
set number nowrap cursorline incsearch ignorecase smartcase
set expandtab autoindent smarttab
set synmaxcol=200

set guifont=Fira\ Code:h11
set guicursor=a:hor33-Cursor
set guicursor+=i:ver33-iCursor
set guicursor+=a:blinkon200-blinkoff50

set mouse=a
set cmdheight=2
set updatetime=500
set shortmess+=c

set title
" Colorscheme
" -------------------------------------
set termguicolors
colorscheme NeoSolarized
set background=light
let g:neosolarized_bold = 1
let g:neosolarized_underline = 1
let g:neosolarized_italic = 1

autocmd CursorHold * silent call CocActionAsync('highlight')

highlight Cursor gui=reverse guifg=reverse guibg=reverse
highlight iCursor gui=reverse guifg=NONE guibg=NONE
hi CocFloating ctermbg=white guibg=#eee8d5
hi CocErrorFloat guifg=#dc322f guibg=NONE


" Session
" -------------------------------------
set sessionoptions+=tabpages,globals


" Functions
" -------------------------------------
function! SynStack()
  if !exists("*synstack")
    return
  endif
  echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunc

function! SetTitle(t)
  let &titlestring = a:t . ' %<%f (' . getcwd() . ')'
endfunction

call SetTitle('-')
