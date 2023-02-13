vim.cmd([[
" Tweaks to zenburn... I only like red to mean a problem.
set termguicolors
au ColorScheme * hi Boolean               ctermfg=181                                   guifg=#bfbfbf
au ColorScheme * hi Character             ctermfg=181   cterm=bold   gui=bold           guifg=#a3aca3
au ColorScheme * hi Constant              ctermfg=181   cterm=bold   gui=NONE           guifg=#a3dcdc
au ColorScheme * hi SpecialChar           ctermfg=181   cterm=bold   gui=bold           guifg=#a3a3dc
au ColorScheme * hi String                ctermfg=174                                   guifg=#3e8fb0
au ColorScheme * hi Tag                   ctermfg=181   cterm=bold   gui=bold           guifg=#93e893

" Cursor colors
au ColorScheme * hi CursorLine                                       guifg=NONE         guibg=#403d52
au ColorScheme * hi CursorColumn          ctermbg=NONE                                  guibg=NONE
au ColorScheme * hi CursorLineNr          ctermbg=NONE  gui=bold     guifg=#e0def4      guibg=NONE
au ColorScheme * hi SpecialKey                          gui=bold     guifg=#e0def4      guibg=NONE
au ColorScheme * hi Cursor                                           guifg=NONE         guibg=#403d52

" Normal mode
au ColorScheme * hi Normal                ctermbg=NONE                                  guibg=NONE
au ColorScheme * hi LineNr                ctermbg=NONE                                  guibg=NONE

" Show white space characters
set listchars=eol:¶,tab:»\ ,trail:·,extends:>,precedes:<,space:·
au ColorScheme * hi NonText                             gui=bold     guifg=#403d52      guibg=NONE
au ColorScheme * hi Whitespace                          gui=bold     guifg=#403d52      guibg=NONE

" Pop-up and Float menu
au ColorScheme * hi Pmenu                                            guifg=#6e6a86      guibg=NONE
au ColorScheme * hi PmenuSbar                                                           guibg=NONE
au ColorScheme * hi PmenuThumb                                                          guibg=NONE
au ColorScheme * hi PmenuSel                            gui=bold     guifg=#e0def4      guibg=NONE
au ColorScheme * hi NormalFloat                         gui=NONE     guifg=#6e6a86      guibg=NONE
au ColorScheme * hi NormalNC                                                            guibg=NONE
au ColorScheme * hi VertSplit                                        guifg=#444444      guibg=NONE
au ColorScheme * hi Title                                            guifg=#e0def4      guibg=NONE
au ColorScheme * hi TelescopeBorder       ctermbg=NONE                                  guibg=NONE
au ColorScheme * hi FloatBorder                         gui=bold     guifg=#56526e      guibg=NONE

" vertical split colors
au ColorScheme * hi VertSplit             ctermbg=NONE                                  guibg=NONE
au ColorScheme * hi NvimTreeVertSplit     ctermbg=NONE               guifg=#393535      guibg=NONE
au ColorScheme * hi NvimTreeWinSeparator  ctermbg=NONE               guifg=#393535      guibg=NONE
au ColorScheme * hi NvimTreeEndOfBuffer   ctermbg=NONE               guifg=#393535      guibg=NONE
au ColorScheme * hi NvimTreeFolderIcon                               guifg=#9ccfd8      guibg=NONE
au ColorScheme * hi Directory                                        guifg=#9ccfd8      guibg=NONE
au ColorScheme * hi ColorColumn           ctermbg=NONE                                  guibg=NONE

" Nvim tree root folder color
au ColorScheme * hi NvimTreeRootFolder                               guifg=#8f8f8f

" Git changes and margins
au ColorScheme * hi GitSignsAdd                                      guifg=#286983      guibg=NONE
au ColorScheme * hi GitSignsDelete                                   guifg=#b4637a      guibg=NONE
au ColorScheme * hi GitSignsChange                                   guifg=#c4a7e7      guibg=NONE
au ColorScheme * hi GitSignsCurrentLineBlame            gui=bold     guifg=#393552      guibg=NONE
au ColorScheme * hi default link gitblame GitSignsCurrentLineBlame

" Diff colours
au ColorScheme * hi DiffAdd               ctermbg=NONE                                  guibg=NONE
au ColorScheme * hi DiffChange            ctermbg=NONE                                  guibg=NONE
au ColorScheme * hi DiffDelete                                       guifg=#552222      guibg=NONE
au ColorScheme * hi DiffText                                         guifg=#b4637a      guibg=NONE

" Selected area colour
hi VisualNOS             ctermbg=NONE                                  guibg=NONE
hi Visual                ctermbg=NONE                                  guibg=#44415a

" Status line colors
hi StatusLineNC          ctermbg=NONE                                  guibg=NONE
hi StatusLine            ctermbg=NONE                                  guibg=NONE

" Diagnostics colors
hi DiagnosticSignError   ctermbg=NONE                                  guibg=NONE
hi DiagnosticSignWarn    ctermbg=NONE                                  guibg=NONE
hi DiagnosticSignInfo    ctermbg=NONE                                  guibg=NONE
hi DiagnosticSignHint    ctermbg=NONE                                  guibg=NONE
hi NormalFloat           ctermbg=NONE                                  guibg=NONE

" LSP In-line error hi.
hi LspDiagnosticsUnderlineError                                        guibg=NONE
hi LspDiagnosticsUnderlineWarning                                      guibg=NONE
hi LspDiagnosticsUnderlineInformation                                  guibg=NONE
hi LspDiagnosticsUnderlineHint                                         guibg=NONE

" Lsp colors
hi LspReferenceText      ctermbg=NONE                                  guibg=NONE

" Lualine colors
hi lualine               ctermbg=NONE                                  guibg=NONE
hi lualine_b_inactive    ctermbg=NONE                guifg=#6e6a86     guibg=NONE
hi lualine_c_inactive    ctermbg=NONE                guifg=#6e6a86     guibg=NONE
hi lualine_a_inactive    ctermbg=NONE  gui=bold      guifg=#6e6a86     guibg=NONE
hi lualine_x_5_inactive  ctermbg=NONE  gui=bold      guifg=#6e6a86     guibg=NONE
hi lualine_x_8_inactive  ctermbg=NONE  gui=bold      guifg=#6e6a86     guibg=NONE
hi lualine_x_12_inactive ctermbg=NONE                guifg=#6e6a86     guibg=NONE
hi lualine_x_14_inactive ctermbg=NONE  gui=bold      guifg=#6e6a86     guibg=NONE
hi lualine_x_20_inactive ctermbg=NONE                guifg=#6e6a86     guibg=NONE

" Match parentheses
au ColorScheme * hi MatchParen                    gui=bold,underline  guifg=#FFFFFF     guibg=#44415a

"Comments color
au ColorScheme * hi Comment                                           guifg=#6e6a86     guibg=NOE

" hi #! lines... Both good and bad.
au ColorScheme * hi sheBangGood                    gui=bold,underline guifg=#b4637a     guibg=NONE
call matchadd('sheBangGood', '^#!/usr/bin/env \(bash\|-S bash -e\|sh\|python3\|zsh\|groovy\|perl\)$', 20)

au ColorScheme * hi sheBangBad                          gui=bold      guifg=#b4637a     guibg=NONE
call matchadd('sheBangBad', '^#!.*')

" current word hiing
" hi IncSearch                         gui=underline guifg=#b4637a     guibg=NONE
au ColorScheme * hi IncSearch                           gui=bold      guifg=#e0def4     guibg=NONE

"hi URL
au ColorScheme * hi hiUrl cterm=underline        ctermfg=31    guifg=#286983     gui=underline

" Lualine hiing
au ColorScheme * hi lualine_c_5_normal                  ctermfg=247   guifg=#908CA9
au ColorScheme * hi lualine_c_5_insert                  ctermfg=247   guifg=#908CA9
au ColorScheme * hi lualine_c_5_visual                  ctermfg=247   guifg=#908CA9
au ColorScheme * hi lualine_c_5_replace                 ctermfg=247   guifg=#908CA9
au ColorScheme * hi lualine_c_5_command                 ctermfg=247   guifg=#908CA9
au ColorScheme * hi lualine_c_5_terminal                ctermfg=247   guifg=#908CA9
au ColorScheme * hi lualine_c_5_inactive                ctermfg=247   guifg=#908CA9

au ColorScheme * hi lualine_c_8_normal                  ctermfg=247   guifg=#908CA9
au ColorScheme * hi lualine_c_8_insert                  ctermfg=247   guifg=#908CA9
au ColorScheme * hi lualine_c_8_visual                  ctermfg=247   guifg=#908CA9
au ColorScheme * hi lualine_c_8_replace                 ctermfg=247   guifg=#908CA9
au ColorScheme * hi lualine_c_8_command                 ctermfg=247   guifg=#908CA9
au ColorScheme * hi lualine_c_8_terminal                ctermfg=247   guifg=#908CA9
au ColorScheme * hi lualine_c_8_inactive                ctermfg=247   guifg=#908CA9

au ColorScheme * hi lualine_c_15_normal                 ctermfg=247   guifg=#908CA9
au ColorScheme * hi lualine_c_15_insert                 ctermfg=247   guifg=#908CA9
au ColorScheme * hi lualine_c_15_visual                 ctermfg=247   guifg=#908CA9
au ColorScheme * hi lualine_c_15_replace                ctermfg=247   guifg=#908CA9
au ColorScheme * hi lualine_c_15_command                ctermfg=247   guifg=#908CA9
au ColorScheme * hi lualine_c_15_terminal               ctermfg=247   guifg=#908CA9
au ColorScheme * hi lualine_c_15_inactive               ctermfg=247   guifg=#908CA9

au ColorScheme * hi lualine_c_20_normal                 ctermfg=247   guifg=#908CA9
au ColorScheme * hi lualine_c_20_insert                 ctermfg=247   guifg=#908CA9
au ColorScheme * hi lualine_c_20_visual                 ctermfg=247   guifg=#908CA9
au ColorScheme * hi lualine_c_20_replace                ctermfg=247   guifg=#908CA9
au ColorScheme * hi lualine_c_20_command                ctermfg=247   guifg=#908CA9
au ColorScheme * hi lualine_c_20_terminal               ctermfg=247   guifg=#908CA9
au ColorScheme * hi lualine_c_20_inactive               ctermfg=247   guifg=#908CA9

au ColorScheme * hi lualine_c_diff_added_normal         ctermfg=31    guifg=#286983
au ColorScheme * hi lualine_c_diff_added_insert         ctermfg=31    guifg=#286983
au ColorScheme * hi lualine_c_diff_added_visual         ctermfg=31    guifg=#286983
au ColorScheme * hi lualine_c_diff_added_replace        ctermfg=31    guifg=#286983
au ColorScheme * hi lualine_c_diff_added_command        ctermfg=31    guifg=#286983
au ColorScheme * hi lualine_c_diff_added_terminal       ctermfg=31    guifg=#286983
au ColorScheme * hi lualine_c_diff_added_inactive       ctermfg=31    guifg=#286983

au ColorScheme * hi lualine_c_diff_removed_normal       ctermfg=168   guifg=#b4637a
au ColorScheme * hi lualine_c_diff_removed_insert       ctermfg=168   guifg=#b4637a
au ColorScheme * hi lualine_c_diff_removed_visual       ctermfg=168   guifg=#b4637a
au ColorScheme * hi lualine_c_diff_removed_replace      ctermfg=168   guifg=#b4637a
au ColorScheme * hi lualine_c_diff_removed_command      ctermfg=168   guifg=#b4637a
au ColorScheme * hi lualine_c_diff_removed_terminal     ctermfg=168   guifg=#b4637a
au ColorScheme * hi lualine_c_diff_removed_inactive     ctermfg=168   guifg=#b4637a

" DevIcons colors
au ColorScheme * hi DevIconTxt                          ctermfg=31    guifg=#286983
au ColorScheme * hi DevIconZshrc                        ctermfg=31    guifg=#286983
au ColorScheme * hi DevIconZsh                          ctermfg=31    guifg=#286983
au ColorScheme * hi DevIconZshenv                       ctermfg=31    guifg=#286983
au ColorScheme * hi DevIconClojureC                     ctermfg=31    guifg=#286983
au ColorScheme * hi DevIconD                            ctermfg=31    guifg=#286983
au ColorScheme * hi DevIconBashProfile                  ctermfg=31    guifg=#286983
au ColorScheme * hi DevIconTerminal                     ctermfg=31    guifg=#286983
au ColorScheme * hi DevIconBashrc                       ctermfg=31    guifg=#286983
au ColorScheme * hi DevIconGvimrc                       ctermfg=31    guifg=#286983
au ColorScheme * hi DevIconTwig                         ctermfg=31    guifg=#286983
au ColorScheme * hi DevIconBat                          ctermfg=31    guifg=#286983
au ColorScheme * hi DevIconZshprofile                   ctermfg=31    guifg=#286983
au ColorScheme * hi DevIconVue                          ctermfg=31    guifg=#286983
au ColorScheme * hi DevIconClojure                      ctermfg=31    guifg=#286983
au ColorScheme * hi DevIconRproj                        ctermfg=31    guifg=#286983
au ColorScheme * hi DevIconBash                         ctermfg=31    guifg=#286983
au ColorScheme * hi DevIconCsv                          ctermfg=31    guifg=#286983
au ColorScheme * hi DevIconXls                          ctermfg=31    guifg=#286983
au ColorScheme * hi DevIconVim                          ctermfg=31    guifg=#286983
au ColorScheme * hi DevIconCMakeLists                   ctermfg=31    guifg=#286983
au ColorScheme * hi DevIconStyle                        ctermfg=31    guifg=#286983
au ColorScheme * hi DevIconR                            ctermfg=31    guifg=#286983


au ColorScheme * hi SignColumn                          ctermbg=NONE  guibg=NONE"
au ColorScheme * hi MsgArea                             ctermbg=NONE  guibg=NONE"
au ColorScheme * hi NvimTreeNormal                      ctermbg=NONE  guibg=NONE
au ColorScheme * hi DiagnosticSignError                 ctermbg=NONE  guibg=NONE
au ColorScheme * hi DiagnosticSignWarn                  ctermbg=NONE  guibg=NONE
au ColorScheme * hi DiagnosticSignHint                  ctermbg=NONE  guibg=NONE
au ColorScheme * hi DiagnosticSignInfo                  ctermbg=NONE  guibg=NONE

au ColorScheme * hi BufferLineTab  ctermbg=NONE guibg=NONE guifg=#8f8f8f guibg=NONE
au ColorScheme * hi BufferLineFill ctermbg=NONE guibg=NONE
]])
