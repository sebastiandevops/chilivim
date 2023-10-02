" Functions {{{1
function! SnippetList()
    let cmd="snippetsList " . &ft
    :e new.txt
    set spell!
    call termopen(cmd)
endfunction

function! SnippetEdit()
    let fname = $HOME . "/.config/nvim/snippets/" . &ft . ".json"
    silent exec ":e " . fname
endfunction

function! SnippetSave()
    let fname = $HOME . "/.config/nvim/snippets/" . &ft . ".json"
    let keyName = input("Snippet keys: ")
    let desc = input("Snippet description: ")
    echo "."
    echo "Saving snippet: " . keyName . "\"" . desc . "\" to " . fname
    let alist = []

    for line in readfile(fname)
        call add(alist, line)
	endfor

    let newlist = alist[0:len(alist)-3]

    call add(newlist, "  },")
    call add(newlist, "  \"" . keyName  ."\": {")
    call add(newlist, "    \"body\": [")
    let txt = split(getreg('"'), '\n')

    for line in txt
        let line = substitute(line, '\','\\\\', "g")
        let line = substitute(line, '"','\\\"', "g")
        let line = substitute(line, '\$','\\\\$', "g")
        call add(newlist, "      \"" . line . "\",")
    endfor

    call add(newlist, "      \"$0\"")
    call add(newlist, "    ],")
    call add(newlist, "    \"description\": \"" . desc . "\",")
    call add(newlist, "    \"prefix\": \"" . keyName . "\"")
    call add(newlist, "  }")
    call add(newlist, "}")

    call writefile(newlist, fname)
    silent exec ":e " . fname
endfunction

function! OpenHelpPage()
  let s:help_word = expand('<cword>')
  :exe ":help " . s:help_word
endfunction

function! ToggleColourCursorLine()
    if &cursorline
        set nocursorline
    else
        set cursorline
        highlight CursorLine                        guibg=#605555
    endif
endfunction

function! ToggleColourCursorColumn()
    if &cursorcolumn
        set nocursorcolumn
    else
        set cursorcolumn
        highlight CursorColumn    guifg=#ffffff     guibg=#403d52
    endif
endfunction

function! ToggleColourLineTooLong()
    if &colorcolumn == 0
        set colorcolumn=80,120
        highlight longLine                          guibg=#5F3F3F
    else
        set colorcolumn=0
        highlight longLine        NONE
    endif
endfunction

function! ToggleColourWhiteSpaceAtEndOfLine()
    if synIDattr(hlID("extraWhitespace"), "bg", "gui") == "Red"
        highlight extraWhitespace NONE
    else
        highlight extraWhitespace                   guibg=Red
    endif
endfunction

let s:blameline=1
function! ToggleColourGitBlame()
    if s:blameline
        let s:blameline=0
    else
        let s:blameline=1
    endif
    Gitsigns toggle_current_line_blame
endfunction

function! ToggleColourSyntax()
    if exists("g:syntax_on")
        syntax off
    else
        syntax enable
    endif
endfunction

function! ToggleColourIncSearch()
    if synIDattr(hlID("IncSearch"), "bg", "gui") == "#3f1f1f"
        highlight IncSearch NONE
    else
        highlight IncSearch      gui=bold              guibg=NONE
    endif
endfunction

" Delete whitespace at end of lines, and put cursor back to where it started.
function! DeleteEndingWhiteSpace()
    let current_position=getpos(".")
    let reg=@/
    %s/\s*$//
    let @/=reg
    unlet reg
    call setpos('.', current_position)
    unlet current_position
endfunction

" If running diff two or more files then....
" See: https://neovim.io/doc/user/options.html
if &diff
    set diffopt+=algorithm:patience
    set diffopt+=indent-heuristic
    let g:diff_translations=0 " Speed up syntax
    set syntax=diff
    set wrap               " Lines wrap to following lines"
    set nolist             " Do not display whitespace
else
    set nowrap             " Display long lines as just one line
    set list               " Do not display whitespace
endif

" Abbreviations {{{1

" Misc
iab waht what
iab Vari Variables
iab teh the
iab tehn then
iab Req Request
iab fb foobar
iab Attr Attributes
iab Appl Application
iab adn and
" }}}

" Disable some things on the dashboard.
" autocmd! Filetype * if &ft=="alpha"| highlight longLine NONE |endif | autocmd WinLeave <buffer> highlight longLine guibg=#5F3F3F
autocmd! BufEnter,BufLeave,Filetype * if &ft=="alpha"| highlight extraWhitespace NONE |endif | autocmd WinLeave <buffer> highlight extraWhitespace guibg=Red

" Highlight matching words in buffer.
" autocmd CursorMoved * exe printf('match IncSearch /\V\<%s\>/', escape(expand('<cword>'), '/\'))
autocmd CursorMoved * if &filetype != 'NvimTree' | exe printf('match IncSearch /\V\<%s\>/', escape(expand('<cword>'), '/\')) | endif

" Ignore CamelCase words when spell checking
fun! IgnoreCamelCaseSpell()
  syn match CamelCase /\<[A-Z][a-z]\+[A-Z].\{-}\>/ contains=@NoSpell transparent
  syn cluster Spell add=CamelCase
endfun
autocmd BufRead,BufNewFile * :call IgnoreCamelCaseSpell()

" <Ctrl-c> and yy copies to clipboard, paste with <shift-insert>
vmap <C-c> y:call system("xclip -i -selection clipboard", getreg("\""))<CR>:call system("xclip -i", getreg("\""))<CR>
vmap yy    y:call system("xclip -i -selection clipboard", getreg("\""))<CR>:call system("xclip -i", getreg("\""))<CR>

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
