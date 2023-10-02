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

function! s:SilentSudoCmd(editor) abort
  let cmd = 'env SUDO_EDITOR=' . a:editor . ' VISUAL=' . a:editor . ' sudo -e'
  let local_nvim = has('nvim') && len($DISPLAY . $SECURITYSESSIONID . $TERM_PROGRAM)
  if !has('gui_running') && !local_nvim
    return ['silent', cmd]
  elseif !empty($SUDO_ASKPASS) ||
        \ filereadable('/etc/sudo.conf') &&
        \ len(filter(readfile('/etc/sudo.conf', '', 50), 'v:val =~# "^Path askpass "'))
    return ['silent', cmd . ' -A']
  else
    return [local_nvim ? 'silent' : '', cmd]
  endif
endfunction

function! s:SudoSetup(file) abort
  if !filereadable(a:file) && !exists('#BufReadCmd#'.fnameescape(a:file))
    execute 'autocmd BufReadCmd ' fnameescape(a:file) 'exe s:SudoReadCmd()'
  endif
  if !filewritable(a:file) && !exists('#BufWriteCmd#'.fnameescape(a:file))
    execute 'autocmd BufReadPost ' fnameescape(a:file) 'set noreadonly'
    execute 'autocmd BufWriteCmd ' fnameescape(a:file) 'exe s:SudoWriteCmd()'
  endif
endfunction

let s:error_file = tempname()

function! s:SudoError() abort
  let error = join(readfile(s:error_file), " | ")
  if error =~# '^sudo' || v:shell_error
    return len(error) ? error : 'Error invoking sudo'
  else
    return error
  endif
endfunction

function! s:SudoReadCmd() abort
  if &shellpipe =~ '|&'
    return 'echoerr ' . string('eunuch.vim: no sudo read support for csh')
  endif
  silent %delete_
  silent doautocmd <nomodeline> BufReadPre
  let [silent, cmd] = s:SilentSudoCmd('cat')
  execute silent 'read !' . cmd . ' "%" 2> ' . s:error_file
  let exit_status = v:shell_error
  silent 1delete_
  setlocal nomodified
  if exit_status
    return 'echoerr ' . string(s:SudoError())
  else
    return 'silent doautocmd BufReadPost'
  endif
endfunction

function! s:SudoWriteCmd() abort
  silent doautocmd <nomodeline> BufWritePre
  let [silent, cmd] = s:SilentSudoCmd('tee')
  let cmd .= ' "%" >/dev/null'
  if &shellpipe =~ '|&'
    let cmd = '(' . cmd . ')>& ' . s:error_file
  else
    let cmd .= ' 2> ' . s:error_file
  endif
  execute silent 'write !'.cmd
  let error = s:SudoError()
  if !empty(error)
    return 'echoerr ' . string(error)
  else
    setlocal nomodified
    return 'silent doautocmd <nomodeline> BufWritePost'
  endif
endfunction

command! -bar -bang -complete=file -nargs=? SudoEdit
      \ call s:SudoSetup(fnamemodify(empty(<q-args>) ? expand('%') : <q-args>, ':p')) |
      \ if !&modified || !empty(<q-args>) |
      \   edit<bang> <args> |
      \ endif |
      \ if empty(<q-args>) || expand('%:p') ==# fnamemodify(<q-args>, ':p') |
      \   set noreadonly |
      \ endif

if exists(':SudoWrite') != 2
command! -bar SudoWrite
      \ call s:SudoSetup(expand('%:p')) |
      \ write!
endif

vnoremap <buffer> <C-x> I123<Esc>

" Increment block {{{2
" Adapted from https://github.com/triglav/vim-visual-increment/blob/master/plugin/visual-increment.vim
" a:step - increment step, default 1
" a:1 - default null, when set to any value, decrement instead
function! s:doincrement(step, ...)
  " visual block start
  let start_column = col("'<")
  let start_row = line("'<")
  " visual block end, as well as the cursor position
  let end_row = line("'>")
  " when 2nd parameter is passed, we are decrementing the numbers instead
  let incrementer = (a:0 > 0 ? '' : '')

  if start_row == end_row
    " just increment/decrement the value if only one line is selected
    exe "normal! ".a:step.incrementer
  else
    " each next line is increased by <a>, from the previous one
    let i = 0

    while line('.') != end_row
      " move to the next line
      call setpos('.', [0, line('.')+1, start_column, 0])

      " if the current line is shorter, skip it
      if start_column < col("$")
        let i += a:step
        " increment the current line by <i>
        exe "normal! ".i.incrementer
      end
    endwhile
  endif
endfunction

" Better Folding in Neovim
set nofoldenable
set foldlevel=99
set fillchars=fold:\ ,vert:\ ,eob:\ ,msgsep:‾ " replace ~ with spaces at endo of buffer
setlocal foldmethod=expr

" Figure out the system Python for Neovim.
if exists("$VIRTUAL_ENV")
    let g:python3_host_prog=substitute(system("which -a python3 | head -n2 | tail -n1"), "\n", '', 'g')
else
    let g:python3_host_prog=substitute(system("which python3"), "\n", '', 'g')
endif

vnoremap <silent> <C-H> I1<esc>:<C-U>call <SID>doincrement(v:count1)<CR>
vnoremap <silent> <C-J> :<C-U>call <SID>doincrement(v:count1)<CR>
vnoremap <silent> <C-K> :<C-U>call <SID>doincrement(v:count1, 1)<CR>

" For Ranger, for some reason does not work in the lua config.
let bufferline = get(g:, 'bufferline', {})
let bufferline.icons="both"
let bufferline.icon_close_tab_modified=''
let bufferline.icon_custom_colors="false"

let g:neovide_cursor_animation_length=0

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

syntax enable              " Enables syntax highlighting
set iskeyword+=-           " Treat dash separated words as a word text object"
set formatoptions-=cro     " Stop newline continuation of comments
set hidden                 " Required to keep multiple buffers open multiple buffers
set t_Co=256               " Support 256 colors
set laststatus=2           " Always display the status line
set background=dark        " tell Vim what the background colour looks like
set noshowmode             " We don't need to see things like -- INSERT -- anymore
set nobackup               " This is recommended by various posts
set nowritebackup          " This is recommended by various posts
set incsearch              " Highlight all matches
set guifont=FiraCode\ Nerd\ Font\ Mono:h11

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

" Remove white space on save for certain file types.
autocmd BufWrite *.py :call DeleteEndingWhiteSpace()
autocmd BufWrite *.java :call DeleteEndingWhiteSpace()
autocmd BufWrite * if &ft=="sh" | :call DeleteEndingWhiteSpace() | endif
autocmd BufWrite * if &ft=="vim" | :call DeleteEndingWhiteSpace() | endif

" I prefer -- for comments in SQL
autocmd FileType sql set commentstring=--\ %s

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
