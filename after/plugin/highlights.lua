vim.cmd([[
set termguicolors

" hi #! lines... Both good and bad.
au ColorScheme * hi sheBangGood  gui=bold,underline                         guifg=#b4637a  guibg=NONE
call matchadd('sheBangGood', '^#!/usr/bin/env \(bash\|-S bash -e\|sh\|python3\|zsh\|groovy\|perl\)$', 20)

au ColorScheme * hi sheBangBad   gui=bold                                   guifg=#9893a5  guibg=NONE
call matchadd('sheBangBad', '^#!.*')

"hi URL
au ColorScheme * hi hiUrl cterm=underline ctermfg=31    gui=underline       guifg=#31748f

]])
