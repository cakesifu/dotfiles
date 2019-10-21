" Deoplete
" -------------------------------------

let g:deoplete#enable_at_startup = 0
autocmd BufEnter * call deoplete#enable()
set shortmess+=c
set completeopt=noselect,menuone

" autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif

call deoplete#custom#option('auto_complete', v:false)
call deoplete#custom#option('auto_complete_delay', 100)
call deoplete#custom#option('max_list', 25)
call deoplete#custom#option('min_pattern_length', 1)
call deoplete#custom#option('on_insert_enter', v:false)

" source customization
call deoplete#custom#source('typescript', 'rank', 1000)
call deoplete#custom#source('neosnip', 'rank', 200)
call deoplete#custom#source('around', 'rank', 50)

call deoplete#custom#option('ignore_sources', {
      \ '_': ['ale'],
      \ '*': ['ale'],
      \ 'typescript': ['ale', 'buffer'],
      \ 'javascript': ['ale', 'buffer'],
      \})


" TAB config
imap <expr> <TAB>
      \ pumvisible()
        \ ? "\<C-n>"
        \ : <SID>check_back_space()
          \ ? "\<TAB>"
          \ : neosnippet#expandable_or_jumpable()
            \ ?  "\<Plug>(neosnippet_expand_or_jump)"
            \ : deoplete#manual_complete()

" Echodoc
" -------------------------------------
let g:echodoc#enable_at_startup = 1
let g:echodoc#type = 'echo'
set noshowmode

" Neosnipet
" -------------------------------------
let g:neosnippet#snippets_directory='~/.config/nvim/custom-snippets'
let g:neosnippet#disable_runtime_snippets = { '_': 1 }

" misc
function! s:check_back_space()
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction

" fix multiplet cursors
function g:Multiple_cursors_before()
  call deoplete#custom#buffer_option('auto_complete', v:false)
endfunction
function g:Multiple_cursors_after()
  call deoplete#custom#buffer_option('auto_complete', v:true)
endfunction


