" Functions {{{1
" Add (push) spaces to make next word align with line above.
function! PushLine()
    let s:h=virtcol('.')
    normal w
    let s:clp=virtcol('.')
    execute "normal! " . s:h . "|"
    normal khw
    let s:plp=virtcol('.')

    if (s:plp - s:clp) > 0
        execute "normal! " . s:clp . "|"
        normal j
        execute "normal! " . (s:plp - s:clp) . "i "
    else
        execute "normal! " . s:plp . "|"
        normal j
        execute "normal! dw"
    endif

    execute "normal! " . s:h . "|"
    normal j
endfunction

function! ShowColours()
    :e new.txt
    set spell!
    call termopen("showcolors")
endfunction

function! ShowChars()
    :e new.txt
    set spell!
    call termopen("showchars")
endfunction

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

function! PrettyPrintFile()
    silent write
    silent exec ':!prettyPrint "'.expand("%:p").'"'
    echo "Code not formatted"
endfunction

function! SqlFlip()
    silent exec ':!$HOME/bin/sak sqlflip'
endfunction

" Jump, looks under the cursor for a URL, Hex Code, GithubProject or Word!
function! JumpToSelection()
  let url=matchstr(expand("<cWORD>"), 'http[s]*:\/\/[^ >,;)]*')
  " let url=matchstr(expand("<cWORD>"), 'https\?:\/\/\(\w\+\(:\w\+\)\?@\)\?\([A-Za-z][-_0-9A-Za-z]*\.\)\{1,}\(\w\{2,}\.\?\)\{1,}\(:[0-9]\{1,5}\)\?\S*/')
  " let url=matchstr(expand("<cWORD>"), 'https\?:\/\/\(\w\+\(:\w\+\)\?@\)\?\([A-Za-z][-_0-9A-Za-z]*\.\)\{1,}\(\w\{2,}\.\?\)\{1,}\(:[0-9]\{1,5}\)\?\S*/')

  " Is it a url?
  if url != ""
      silent exec ":!xdg-open '".url."'" | redraw!
      echo "Opening URL ".url
  else
      let wordUnderCursor = expand("<cWORD>")
      let hexcode = matchstr(wordUnderCursor, '[0-9a-fA-F]\{6}')

      " Is it a hex colour code?
      if hexcode != ""
          let url="https://www.colorhexa.com/" . hexcode
          silent exec ':!xdg-open "'.url.'"' | redraw!
          echo "Opened HEX colour ".url
      else
          let projectPath = matchstr(wordUnderCursor, '[0-9a-zA-Z-]\{3,}/[0-9a-z-A-Z\.]\{3,}')

          " Is it a GitHub project?
          if projectPath != ""
              let url="https://github.com/" . projectPath
              silent exec ':!xdg-open "'.url.'"' | redraw!
              echo "Opened GitHub project : ".projectPath
          else
              let jiraTicket = matchstr(wordUnderCursor, '[a-zA-Z]\{2,4}-[0-9]\{1,7}')

              " Is it a Jira ticket number project?
              if jiraTicket != ""
                  exec ':!$HOME/bin/Jira open '.jiraTicket
              else
                  let url='https://cheat.sh/' . &filetype . '/' . wordUnderCursor

                  if url != ""
                      let $CURLCMDVIM='https://cheat.sh/' . &filetype . '/' . wordUnderCursor
                      term curl -s $CURLCMDVIM
                      echo "Opened Cheat ".url
                  else
                      echo "No URL, HEX colour sequence, GitHub Project or Keyword under cursor."
                  endif
              endif
          endif
      endif
  endif
endfunction

" Use Jira command line tool to show info for current ticket (if under cursor)
" or branch for current project file is in.
function! ShowJira()
    let wordUnderCursor = expand("<cWORD>")
    let jiraTicket = matchstr(wordUnderCursor, '[a-zA-Z]\{2,4}-[0-9]\{1,7}')

    if jiraTicket != ""
        let $TICKET=jiraTicket
        term $HOME/bin/Jira show $TICKET
    else
        term $HOME/bin/Jira show
    endif
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
        highlight CursorColumn    guifg=#ffffff     guibg=#483d8b
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

function! ToggleGutter()
    if &foldcolumn == 1
        set foldcolumn=0
        set nonumber
        set norelativenumber
        Gitsigns detach
    else
        set foldcolumn=1
        set number
        highlight LineNr          guifg=RoyalBlue1  guibg=Gray19
        set relativenumber
        highlight CursorLineNr    guifg=Yellow      guibg=Gray19
        Gitsigns attach
    endif
endfunction

let s:markerline=1
function! ToggleMarkerLines()
    if s:markerline
        let s:markerline=0
        highlight markerLineCommentAmber        NONE
        highlight markerLineCommentGreen        NONE
        highlight markerLineCommentRed          NONE
        highlight markerLineCommentBrightRed    NONE
    else
        let s:markerline=1
        highlight markerLineCommentAmber               guifg=#000000     guibg=#999900
        highlight markerLineCommentGreen               guifg=#000000     guibg=#009900
        highlight markerLineCommentRed                 guifg=#000000     guibg=#990000
        highlight markerLineCommentBrightRed           guifg=#000000     guibg=#FF0000
    endif
endfunction

function ToggleAll()
    call ToggleColourCursorColumn()
    call ToggleColourLineTooLong()
    call ToggleColourWhiteSpaceAtEndOfLine()
    call ToggleColourGitBlame()
    call ToggleColourIncSearch()
    call ToggleMarkerLines()
    set spell!
    set list!
    set foldenable!
    highlight markerStart NONE
    highlight markerEnd NONE
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

" Highlight a column in CSV text.
" See: https://vim.fandom.com/wiki/Working_with_CSV_files
" :Csv 1    " highlight first column
" :Csv 12   " highlight twelfth column
" :Csv 0    " switch off highlight
highlight CsvColHeading guifg=Yellow guibg=Black
function! CSVH(colnr)
  if a:colnr > 1
    let n = a:colnr - 1

    execute 'match CsvColHeading /^\([^,]*,\)\{'.n.'}\zs[^,]*/'
    " execute 'match CsvColHighlight /^\([^,|\t]*[,|\t]\)\{'.n.'}\zs[^,|\t]*/'
    execute 'normal! 0'.n.'f,'
    execute 'syntax match csvHeading /\%1l\%(\%("\zs\%([^"]\|""\)*\ze"\)\|\%(\zs[^,"]*\ze\)\)/'
    execute 'highlight csvHeading guifg=Yellow guibg=Black gui=bold'
  elseif a:colnr == 1
    match CsvColHighlight /^[^,|\t]*/
    normal! 0
  else
    match
  endif
endfunction

function FoldingToggle()
    if &foldmethod == 'diff'
        if &foldenable == 1
            set foldenable!
            echo "Folding switched off"
            highlight markerStart              NONE
            highlight markerEnd                NONE
        else
            highlight markerStart              guifg=#777777     guibg=#000000
            highlight markerEnd                guifg=#777777     guibg=#000000
            set foldenable
            set foldmethod=manual
            echo "Folding method set to Manual"
        endif
    elseif &foldmethod == 'manual'
        set foldenable
        set foldmethod=indent
        echo "Folding method set to Indent"
    elseif &foldmethod == 'indent'
        set foldenable
        set foldmethod=marker
        echo "Folding method set to Marker"
    elseif &foldmethod == 'marker'
        set foldenable
        set foldmethod=syntax
        echo "Folding method set to Syntax"
    elseif &foldmethod == 'syntax'
        set foldenable
        set foldmethod=diff
        echo "Folding method set to Diff"
    endif
endfunction

function FullScreenToggle()
    let g:neovide_fullscreen=!g:neovide_fullscreen
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

" Set the vertical split character to  a space (there is a single space after '\ ')
" :set fillchars+=vert:\

" Better Folding in Neovim

set nofoldenable
set foldlevel=99
set foldtext=CustomFoldText()
set fillchars=fold:\ ,vert:\ ,eob:\ ,msgsep:‾ " replace ~ with spaces at endo of buffer
setlocal foldmethod=expr
setlocal foldexpr=GetPotionFold(v:lnum)
function! GetPotionFold(lnum)
  if getline(a:lnum) =~? '\v^\s*$'
    return '-1'
  endif
  let this_indent = IndentLevel(a:lnum)
  let next_indent = IndentLevel(NextNonBlankLine(a:lnum))
  if next_indent == this_indent
    return this_indent
  elseif next_indent < this_indent
    return this_indent
  elseif next_indent > this_indent
    return '>' . next_indent
  endif
endfunction
function! IndentLevel(lnum)
    return indent(a:lnum) / &shiftwidth
endfunction
function! NextNonBlankLine(lnum)
  let numlines = line('$')
  let current = a:lnum + 1
  while current <= numlines
      if getline(current) =~? '\v\S'
          return current
      endif
      let current += 1
  endwhile
  return -2
endfunction
function! CustomFoldText()
  " get first non-blank line
  let fs = v:foldstart
  while getline(fs) =~ '^\s*$' | let fs = nextnonblank(fs + 1)
  endwhile
  if fs > v:foldend
      let line = getline(v:foldstart)
  else
      let line = substitute(getline(fs), '\t', repeat(' ', &tabstop), 'g')
  endif
  let w = winwidth(0) - &foldcolumn - (&number ? 8 : 0)
  let foldSize = 1 + v:foldend - v:foldstart
  let foldSizeStr = " " . foldSize . " lines "
  let foldLevelStr = repeat("+--", v:foldlevel)
  let expansionString = repeat(" ", w - strwidth(foldSizeStr.line.foldLevelStr))
  return line . expansionString . foldSizeStr . foldLevelStr
endfunction


vnoremap <silent> <C-H> I1<esc>:<C-U>call <SID>doincrement(v:count1)<CR>
vnoremap <silent> <C-J> :<C-U>call <SID>doincrement(v:count1)<CR>
vnoremap <silent> <C-K> :<C-U>call <SID>doincrement(v:count1, 1)<CR>
" }}}2

" }}}1

" Settings {{{1

" For Ranger, for some reason does not work in the lua config.
let bufferline = get(g:, 'bufferline', {})
let bufferline.icons="both"
let bufferline.icon_close_tab_modified=''
let bufferline.icon_custom_colors="false"

let g:github_enterprise_urls = ['https://bitbucket.org']
let g:startify_session_dir=['~/.config/nvim/sessions']
let g:neovide_cursor_animation_length=0
let g:neovide_fullscreen=v:true

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

" " Setup spelling
" set spell
" setlocal spell spelllang=en_gb
" set spellfile=~/bin/dictionaries/dictionary.add

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

" augroup lsp
  " au!
  " au FileType java lua require('jdtls').start_or_attach({cmd = {'java-linux-ls'}})
" augroup end

" Return to last edit position when opening files.
" autocmd BufReadPost *
"      \ if line("'\"") > 0 && line("'\"") <= line("$") |
"      \   exe "normal! g`\"" |
"      \ endif

" }}}


