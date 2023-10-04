" Disable some things on the dashboard.
" autocmd! Filetype * if &ft=="alpha"| highlight longLine NONE |endif | autocmd WinLeave <buffer> highlight longLine guibg=#5F3F3F
autocmd! BufEnter,BufLeave,Filetype * if &ft=="alpha"| highlight extraWhitespace NONE |endif | autocmd WinLeave <buffer> highlight extraWhitespace guibg=Red

" Highlight matching words in buffer.
" autocmd CursorMoved * exe printf('match IncSearch /\V\<%s\>/', escape(expand('<cword>'), '/\'))
autocmd CursorMoved * if &filetype != 'NvimTree' | exe printf('match IncSearch /\V\<%s\>/', escape(expand('<cword>'), '/\')) | endif

" vim-grammarous rules
 let g:grammarous#disabled_rules = {
            \ '*' : ['WHITESPACE_RULE', 'EN_QUOTES'],
            \ 'help' : ['WHITESPACE_RULE', 'EN_QUOTES', 'SENTENCE_WHITESPACE', 'UPPERCASE_SENTENCE_START'],
            \ }

let g:grammarous#hooks = {}
function! g:grammarous#hooks.on_check(errs) abort
    nmap <buffer><C-n> <Plug>(grammarous-move-to-next-error)
    nmap <buffer><C-p> <Plug>(grammarous-move-to-previous-error)
endfunction

let g:grammarous#disabled_categories = {
            \ '*' : ['PUNCTUATION', 'TYPOGRAPHY'],
            \ 'help' : ['PUNCTUATION', 'TYPOGRAPHY'],
            \ }

function! g:grammarous#hooks.on_reset(errs) abort
    nunmap <buffer><C-n>
    nunmap <buffer><C-p>
endfunction

let g:grammarous#jar_url = 'https://www.languagetool.org/download/LanguageTool-5.9.zip'

set nocompatible
filetype plugin on       " may already be in your .vimrc
