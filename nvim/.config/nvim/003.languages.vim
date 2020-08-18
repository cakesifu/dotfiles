" ALE ------------------------------------------------------------------"

let g:ale_linters = {
\   'javascript': ['eslint'],
\   'typescript': ['eslint', 'tsserver', 'typecheck'],
\}
let g:ale_fixers = {
\   'javascript': ['eslint'],
\   'typescript': ['eslint'],
\   'typescriptreact': ['eslint'],
\}

let g:ale_linter_aliases = {'typescriptreact': 'typescript'}

let g:ale_sign_error = '●'
let g:ale_sign_warning = '.'
let g:ale_lint_on_enter = 0
let g:ale_lint_delay = 2000
let g:ale_lint_on_text_changed = 'never'
let g:ale_lint_on_insert_leave = 1
let g:ale_echo_msg_format = '[%linter%:%severity%] %s'

" Ctrl-P ---------------------------------------------------------------"

let g:ctrlp_custom_ignore = {
    \ 'dir':  '\v[\/]\.(git|hg|svn)$|bower_components|node_modules',
    \ 'file': '\.pyc$\|\.pyo$\|\.rbc$|\.rbo$\|\.class$\|\.o$\|\~$\',
    \ }

" vim-jsx-pretty -------------------------------------------------------"

let g:vim_jsx_pretty_highlight_close_tag = 1
let g:vim_jsx_pretty_disable_tsx = 0

" vim-prettier ---------------------------------------------------------"

let g:prettier#quickfix_enabled = 0
let g:prettier#exec_cmd_async = 1
autocmd BufWritePre *.js,*.jsx,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.md,*.yaml,*.html,*.yml Prettier

