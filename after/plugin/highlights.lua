vim.cmd([[
set termguicolors

" au ColorScheme * hi Boolean               ctermfg=181                                      guifg=#bfbfbf
" au ColorScheme * hi Character             ctermfg=181   gui=bold            cterm=bold     guifg=#a3aca3
" au ColorScheme * hi Constant              ctermfg=181   gui=NONE            cterm=bold     guifg=#a3dcdc
" au ColorScheme * hi SpecialChar           ctermfg=181   gui=bold            cterm=bold     guifg=#a3a3dc
" au ColorScheme * hi String                ctermfg=174                                      guifg=#3e8fb0
" au ColorScheme * hi Tag                   ctermfg=181   gui=bold            cterm=bold     guifg=#93e893
au ColorScheme * hi SpecialKey                          gui=bold            guifg=#e0def4  guibg=NONE
au ColorScheme * hi Substitute                          gui=bold            guifg=#e0def4  guibg=#b4637a

" Match parentheses
au ColorScheme * hi MatchParen                          gui=bold,underline  guifg=#FFFFFF  guibg=#282828

" Show white space characters
set listchars=eol:¶,tab:»\ ,trail:·,extends:>,precedes:<,space:·
au ColorScheme * hi NonText                             gui=bold            guifg=#403d52  guibg=NONE
au ColorScheme * hi Whitespace                          gui=bold            guifg=#403d52  guibg=NONE
" Selected area colour
au ColorScheme * hi VisualNOS             ctermbg=NONE                                     guibg=NONE
au ColorScheme * hi Visual                ctermbg=NONE                                     guibg=#6e6a86
au ColorScheme * hi IndentBlanklineChar                 gui=bold            guifg=#403d52  guibg=NONE

"Comments color
" au ColorScheme * hi Comment                                               guifg=#6e6a86  guibg=NONE

" hi #! lines... Both good and bad.
au ColorScheme * hi sheBangGood  gui=bold,underline                         guifg=#b4637a  guibg=NONE
call matchadd('sheBangGood', '^#!/usr/bin/env \(bash\|-S bash -e\|sh\|python3\|zsh\|groovy\|perl\)$', 20)

au ColorScheme * hi sheBangBad   gui=bold                                   guifg=#403d52  guibg=NONE
call matchadd('sheBangBad', '^#!.*')

" current word hiing
" hi IncSearch                                          gui=underline       guifg=#b4637a  guibg=NONE
au ColorScheme * hi IncSearch             ctermbg=NONE  gui=bold            guifg=#e0def4  guibg=NONE
au ColorScheme * hi CurSearch             ctermbg=NONE  gui=bold            guifg=#e0def4  guibg=#282828
au ColorScheme * hi Search                ctermbg=NONE  gui=bold            guifg=#e0def4  guibg=#282828
au ColorScheme * hi IlluminatedWord       ctermbg=NONE  gui=bold            guifg=#e0def4  guibg=#282828

"hi URL
au ColorScheme * hi hiUrl cterm=underline ctermfg=31    gui=underline       guifg=#72A7BC

" Cursor colors
au ColorScheme * hi CursorLine                                              guifg=NONE     guibg=#403d52
au ColorScheme * hi CursorColumn          ctermbg=NONE                                     guibg=#403d52
au ColorScheme * hi CursorLineNr          ctermbg=NONE  gui=bold            guifg=#e0def4  guibg=NONE
au ColorScheme * hi Cursor                                                  guifg=NONE     guibg=#403d52

" Normal mode
au ColorScheme * hi Normal                ctermbg=NONE                                     guibg=NONE
au ColorScheme * hi LineNr                ctermbg=NONE                                     guibg=NONE

" Pop-up and Float menu
au ColorScheme * hi Pmenu                                                   guifg=#6e6a86  guibg=NONE
au ColorScheme * hi PmenuSbar                                                              guibg=NONE
au ColorScheme * hi PmenuThumb                                                             guibg=NONE
au ColorScheme * hi PmenuSel                            gui=bold            guifg=#e0def4  guibg=NONE
au ColorScheme * hi NormalFloat                         gui=NONE            guifg=#6e6a86  guibg=NONE
au ColorScheme * hi NormalNC                                                               guibg=NONE
au ColorScheme * hi VertSplit             ctermbg=NONE                      guifg=NONE     guibg=NONE
au ColorScheme * hi Title                                                   guifg=#e0def4  guibg=NONE
au ColorScheme * hi TelescopeBorder       ctermbg=NONE                      guifg=#484848  guibg=NONE
au ColorScheme * hi FloatBorder                         gui=bold            guifg=#484848  guibg=NONE

" vertical split and NvimTree colors
au ColorScheme * hi VertSplit             ctermbg=NONE                                     guibg=NONE
au ColorScheme * hi NvimTreeVertSplit     ctermbg=NONE                      guifg=NONE     guibg=NONE
au ColorScheme * hi NvimTreeWinSeparator  ctermbg=NONE                      guifg=NONE     guibg=NONE
au ColorScheme * hi NvimTreeEndOfBuffer   ctermbg=NONE                      guifg=#393535  guibg=NONE
" au ColorScheme * hi NvimTreeFolderIcon                                    guifg=#66a3ad  guibg=NONE
" au ColorScheme * hi Directory                         gui=bold            guifg=#66a3ad  guibg=NONE
" au ColorScheme * hi NvimTreeRootFolder                gui=bold            guifg=#b4637a
" au ColorScheme * hi NvimTreeNormal      ctermbg=NONE                      guifg=#9893a5  guibg=NONE
"
" Git changes and margins
au ColorScheme * hi GitSignsAdd                                             guifg=#f6c177  guibg=NONE
au ColorScheme * hi GitSignsDelete                                          guifg=#fa5757  guibg=NONE
au ColorScheme * hi GitSignsChange                                          guifg=#9893a5  guibg=NONE
au ColorScheme * hi GitSignsCurrentLineBlame                                guifg=#56526e  guibg=NONE
au ColorScheme * hi default link gitblame GitSignsCurrentLineBlame

" Diff colours
au ColorScheme * hi DiffAdd               ctermbg=NONE                      guifg=#f6c177  guibg=NONE
au ColorScheme * hi DiffChange            ctermbg=NONE                      guifg=#9893a5  guibg=NONE
au ColorScheme * hi DiffDelete                                              guifg=#fa5757  guibg=NONE
au ColorScheme * hi DiffText                                                guifg=#b4637a  guibg=NONE

" Lsp and Diagnostics colors
" Diagnostics colors
au ColorScheme * hi DiagnosticSignError   ctermbg=NONE                                     guibg=NONE
au ColorScheme * hi DiagnosticSignWarn    ctermbg=NONE                                     guibg=NONE
au ColorScheme * hi DiagnosticSignInfo    ctermbg=NONE                                     guibg=NONE
au ColorScheme * hi DiagnosticSignHint    ctermbg=NONE                                     guibg=NONE
au ColorScheme * hi NormalFloat           ctermbg=NONE                                     guibg=NONE
au ColorScheme * hi DiagnosticSignError   ctermbg=NONE                                     guibg=NONE
au ColorScheme * hi DiagnosticSignWarn    ctermbg=NONE                                     guibg=NONE
au ColorScheme * hi DiagnosticSignHint    ctermbg=NONE                                     guibg=NONE
au ColorScheme * hi DiagnosticSignInfo    ctermbg=NONE                                     guibg=NONE

" LSP In-line error hi.
au ColorScheme * hi LspDiagnosticsUnderlineError                                           guibg=NONE
au ColorScheme * hi LspDiagnosticsUnderlineWarning                                         guibg=NONE
au ColorScheme * hi LspDiagnosticsUnderlineInformation                                     guibg=NONE
au ColorScheme * hi LspDiagnosticsUnderlineHint                                            guibg=NONE

" Telescope
au ColorScheme * hi TelescopeSelection    ctermbg=NONE  gui=bold            guifg=#e0def4  guibg=#282828

" Lsp colors
au ColorScheme * hi LspReferenceText      ctermbg=NONE  gui=bold            guifg=#e0def4  guibg=NONE

au ColorScheme * hi SignColumn            ctermbg=NONE                                     guibg=NONE
au ColorScheme * hi MsgArea               ctermbg=NONE                                     guibg=NONE
" Status line colors
au ColorScheme * hi StatusLineNC          ctermbg=NONE                                     guibg=NONE
au ColorScheme * hi StatusLine            ctermbg=NONE                                     guibg=NONE

au ColorScheme * hi BufferLineTab         ctermbg=NONE                      guifg=#8f8f8f  guibg=NONE
au ColorScheme * hi BufferLineFill        ctermbg=NONE                                     guibg=NONE

" DevIcons colors
" au ColorScheme * hi DevIconTxt            ctermfg=31                        guifg=#286983
" au ColorScheme * hi DevIconZshrc          ctermfg=31                        guifg=#286983
" au ColorScheme * hi DevIconZsh            ctermfg=31                        guifg=#286983
" au ColorScheme * hi DevIconZshenv         ctermfg=31                        guifg=#286983
" au ColorScheme * hi DevIconClojureC       ctermfg=31                        guifg=#286983
" au ColorScheme * hi DevIconD              ctermfg=31                        guifg=#286983
" au ColorScheme * hi DevIconBashProfile    ctermfg=31                        guifg=#286983
" au ColorScheme * hi DevIconTerminal       ctermfg=31                        guifg=#286983
" au ColorScheme * hi DevIconBashrc         ctermfg=31                        guifg=#286983
" au ColorScheme * hi DevIconGvimrc         ctermfg=31                        guifg=#286983
" au ColorScheme * hi DevIconTwig           ctermfg=31                        guifg=#286983
" au ColorScheme * hi DevIconBat            ctermfg=31                        guifg=#286983
" au ColorScheme * hi DevIconZshprofile     ctermfg=31                        guifg=#286983
" au ColorScheme * hi DevIconVue            ctermfg=31                        guifg=#286983
" au ColorScheme * hi DevIconClojure        ctermfg=31                        guifg=#286983
" au ColorScheme * hi DevIconRproj          ctermfg=31                        guifg=#286983
" au ColorScheme * hi DevIconBash           ctermfg=31                        guifg=#286983
" au ColorScheme * hi DevIconCsv            ctermfg=31                        guifg=#286983
" au ColorScheme * hi DevIconXls            ctermfg=31                        guifg=#286983
" au ColorScheme * hi DevIconVim            ctermfg=31                        guifg=#286983
" au ColorScheme * hi DevIconCMakeLists     ctermfg=31                        guifg=#286983
" au ColorScheme * hi DevIconStyle          ctermfg=31                        guifg=#286983
" au ColorScheme * hi DevIconR              ctermfg=31                        guifg=#286983
]])
