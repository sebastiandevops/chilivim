vim.cmd([[
set termguicolors

" Match parentheses
au ColorScheme * hi MatchParen            ctermbg=232   gui=bold,underline  guifg=#FFFFFF  guibg=#191919

" Show white space characters
set listchars=eol:¶,tab:»\ ,trail:·,extends:>,precedes:<,space:·
au ColorScheme * hi NonText                             gui=bold            guifg=#403d52  guibg=NONE
au ColorScheme * hi Whitespace                          gui=bold            guifg=#403d52  guibg=NONE
au ColorScheme * hi Operator                                                guifg=#bbbbbb
au ColorScheme * hi Delimiter                                               guifg=#bbbbbb
" Selected area colour
" au ColorScheme * hi VisualNOS             ctermbg=NONE                                     guibg=NONE
au ColorScheme * hi Visual                              gui=bold            guifg=#393552    guibg=#fcb2aa
au ColorScheme * hi IndentBlanklineChar                 gui=bold            guifg=#56526e    guibg=NONE
au ColorScheme * hi IndentBlanklineContextStart cterm=underline gui=underline guisp=#9893a5
au ColorScheme * hi IndentBlanklineContextChar guifg=#9893a5
" au ColorScheme * hi IndentBlanklineSpaceCharBlankline cterm=nocombine gui=nocombine guifg=#e0def4
" au ColorScheme * hi IndentBlanklineSpaceChar cterm=nocombine gui=nocombine guifg=#e0def4

"Comments color
au ColorScheme * hi Comment                                                 guifg=#6e6a86  guibg=NONE

" hi #! lines... Both good and bad.
au ColorScheme * hi sheBangGood  gui=bold,underline                         guifg=#b4637a  guibg=NONE
call matchadd('sheBangGood', '^#!/usr/bin/env \(bash\|-S bash -e\|sh\|python3\|zsh\|groovy\|perl\)$', 20)

au ColorScheme * hi sheBangBad   gui=bold                                   guifg=#9893a5  guibg=NONE
call matchadd('sheBangBad', '^#!.*')

" current word hiing
" hi IncSearch                                          gui=underline       guifg=#b4637a  guibg=NONE
au ColorScheme * hi IncSearch             ctermbg=NONE  gui=bold            guifg=#e0def4  guibg=NONE
au ColorScheme * hi CurSearch             ctermbg=NONE  gui=bold            guifg=#e0def4  guibg=#524f67
au ColorScheme * hi Search                ctermbg=NONE  gui=bold            guifg=#242424  guibg=#d7827e
au ColorScheme * hi IlluminatedWord       ctermbg=NONE  gui=bold            guifg=#e0def4  guibg=NONE
"
"hi URL
au ColorScheme * hi hiUrl cterm=underline ctermfg=31    gui=underline       guifg=#31748f

" Cursor colors
au ColorScheme * hi CursorLineNr          ctermbg=NONE  gui=bold            guifg=#e0def4  guibg=NONE
au ColorScheme * hi CursorLine                                              guifg=NONE     guibg=#121212

" Normal mode
au ColorScheme * hi LineNr                ctermbg=NONE                      guifg=#66627e   guibg=NONE

" Pop-up and Float menu
au ColorScheme * hi Pmenu                                                   guifg=#6e6a86  guibg=NONE
au ColorScheme * hi PmenuSbar                                                              guibg=NONE
au ColorScheme * hi PmenuThumb                                                             guibg=NONE
au ColorScheme * hi PmenuSel                            gui=bold            guifg=#e0def4  guibg=NONE
au ColorScheme * hi NormalFloat                         gui=NONE            guifg=#6e6a86  guibg=NONE
" au ColorScheme * hi NormalNC                                                               guibg=NONE
" au ColorScheme * hi VertSplit             ctermbg=NONE                      guifg=NONE     guibg=NONE
" au ColorScheme * hi Title                                                   guifg=#e0def4  guibg=NONE
" au ColorScheme * hi TelescopeBorder       ctermbg=NONE                      guifg=#484848  guibg=NONE
au ColorScheme * hi FloatBorder                         gui=bold            guifg=#6e6a86  guibg=NONE

" vertical split and NvimTree colors
" au ColorScheme * hi NvimTreeEndOfBuffer   ctermbg=NONE                      guifg=#393535  guibg=NONE
" au ColorScheme * hi NvimTreeFolderIcon                                    guifg=#66a3ad  guibg=NONE
" au ColorScheme * hi Directory                         gui=bold            guifg=#66a3ad  guibg=NONE
" au ColorScheme * hi NvimTreeRootFolder                gui=bold            guifg=#b4637a
au ColorScheme * hi NvimTreeNormal                                          guifg=#a8a3b5
au ColorScheme * hi NvimTreeCursorLine                  gui=bold            guifg=#f0eeff  guibg=NONE
"
" Git changes and margins
" au ColorScheme * hi GitSignsAdd                                             guifg=#f6c177  guibg=NONE
" au ColorScheme * hi GitSignsDelete                                          guifg=#fa5757  guibg=NONE
" au ColorScheme * hi GitSignsChange                                          guifg=#9893a5  guibg=NONE
" au ColorScheme * hi GitSignsCurrentLineBlame                                guifg=#56526e  guibg=NONE
" au ColorScheme * hi default link gitblame GitSignsCurrentLineBlame

" Diff colours
" au ColorScheme * hi DiffAdd               ctermbg=NONE                      guifg=#f6c177  guibg=NONE
" au ColorScheme * hi DiffChange            ctermbg=NONE                      guifg=#9893a5  guibg=NONE
" au ColorScheme * hi DiffDelete                                              guifg=#fa5757  guibg=NONE
" au ColorScheme * hi DiffText                                                guifg=#b4637a  guibg=NONE

" Telescope
" au ColorScheme * hi TelescopeSelection    ctermbg=NONE  gui=bold            guifg=#e0def4  guibg=#282828
au ColorScheme * hi TelescopeBorder         ctermbg=NONE                      guifg=#6e6a86  guibg=NONE

" Lsp colors
" au ColorScheme * hi LspReferenceText      ctermbg=NONE  gui=bold            guifg=#e0def4  guibg=NONE

]])
