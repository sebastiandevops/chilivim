" Disable some things on the dashboard.
" autocmd! Filetype * if &ft=="alpha"| highlight longLine NONE |endif | autocmd WinLeave <buffer> highlight longLine guibg=#5F3F3F
autocmd! BufEnter,BufLeave,Filetype * if &ft=="alpha"| highlight extraWhitespace NONE |endif | autocmd WinLeave <buffer> highlight extraWhitespace guibg=Red

" Highlight matching words in buffer.
" autocmd CursorMoved * exe printf('match IncSearch /\V\<%s\>/', escape(expand('<cword>'), '/\'))
autocmd CursorMoved * if &filetype != 'NvimTree' | exe printf('match IncSearch /\V\<%s\>/', escape(expand('<cword>'), '/\')) | endif

set nocompatible
filetype plugin on       " may already be in your .vimrc
