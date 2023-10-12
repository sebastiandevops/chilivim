local utils_status_ok, utils = pcall(require, 'utils.get_python_host')
if not utils_status_ok then
  return
end

local set = vim.opt -- global options

set.backup = false                          -- creates a backup file
set.clipboard = "unnamedplus"               -- allows neovim to access the system clipboard
set.cmdheight = 1                           -- more space in the neovim command line for displaying messages
set.completeopt = { "menuone", "noselect" } -- mostly just for cmp
set.conceallevel = 0                        -- so that `` is visible in markdown files
set.fileencoding = "utf-8"                  -- the encoding written to a file
set.hlsearch = true                         -- highlight all matches on previous search pattern
set.ignorecase = true                       -- ignore case in search patterns
set.mouse = "a"                             -- allow the mouse to be used in neovim
set.pumheight = 10                          -- pop up menu height
set.showmode = false                        -- we don't need to see things like -- INSERT -- anymore
set.showtabline = 0                         -- always show tabs
set.smartcase = true                        -- smart case
set.smartindent = true                      -- make indenting smarter again
set.splitbelow = true                       -- force all horizontal splits to go below current window
set.splitright = true                       -- force all vertical splits to go to the right of current window
set.swapfile = false                        -- creates a swapfile
set.termguicolors = true                    -- set term gui colors (most terminals support this)
set.timeoutlen = 750                        -- time to wait for a mapped sequence to complete (in milliseconds)
set.undofile = true                         -- enable persistent undo
set.updatetime = 300                        -- faster completion (4000ms default)
set.writebackup = false                     -- if a file is being edited by another program (or was written to file while editing with another program), it is not allowed to be edited
set.expandtab = true                        -- convert tabs to spaces
set.shiftwidth = 2                          -- the number of spaces inserted for each indentation
set.tabstop = 2                             -- insert 2 spaces for a tab
set.smarttab = true                         -- Makes tabbing smarter will realize you have 2 vs 4
set.cursorline = true                       -- highlight the current line
set.number = true                           -- set numbered lines
set.laststatus = 3                          -- only the last window will always have a status line
set.showcmd = false                         -- hide (partial) command in the last line of the screen (for performance)
set.ruler = true                            -- Show the line and column number of the cursor position
set.numberwidth = 4                         -- minimal number of columns to use for the line number {default 4}
set.signcolumn = "yes"                      -- always show the sign column, otherwise it would shift the text each time
set.wrap = false                            -- display lines as one long line
set.scrolloff = 8                           -- minimal number of screen lines to keep above and below the cursor
set.sidescrolloff = 8                       -- minimal number of screen columns to keep to the left and right of the cursor if wrap is `false`
set.guifont = "monospace:h17"               -- the font used in graphical neovim applications
set.fillchars.eob=" "                       -- show empty lines at the end of a buffer as ` ` {default `~`}
set.shortmess:append "c"                    -- hide all the completion messages, e.g. "-- XXX completion (YYY)", "match 1 of 2", "The only match", "Pattern not found"
set.whichwrap:append("<,>,[,],h,l")         -- keys allowed to move to the previous/next line when the beginning/end of line is reached
set.iskeyword:append("-")                   -- treat dash separated words as a word text object
set.colorcolumn = "99999"                   -- Fixes indentline for now

set.linebreak = true

set.hidden = true                           -- Required to keep multiple buffers open multiple buffers

-- set.shortmess = "ilmnrx"                        -- flags to shorten vim messages, see :help 'shortmess'
set.shortmess:append "c"                           -- don't give |ins-completion-menu| messages
set.iskeyword:append "-"                           -- hyphenated words recognized by searches
set.formatoptions:remove({ "c", "r", "o" })        -- don't insert the current comment leader automatically for auto-wrapping comments using 'textwidth', hitting <Enter> in insert mode, or hitting 'o' or 'O' in normal mode.
set.runtimepath:remove("/usr/share/vim/vimfiles")  -- separate vim plugins from neovim in case vim still in use

set.foldexpr = "" -- set to "nvim_treesitter#foldexpr()" for treesitter based folding

-- check speller
set.spelllang = "en_us,es"
set.spell = true

-- Better Folding in Neovim
set.foldenable = false
set.foldlevel = 99

-- hide vertical lines and replace ~ with spaces at end of buffer
vim.cmd "let &fcs='fold: ,vert: ,eob: ,msgsep:‾'"

vim.g.python3_host_prog = utils.get_python3_host_prog()

-- Check if Neovim is running in diff mode
if vim.o.diff then
    -- Set diff options
    vim.o.diffopt = vim.o.diffopt .. ',algorithm:patience'
    vim.o.diffopt = vim.o.diffopt .. ',indent-heuristic'
    vim.g.diff_translations = 0 -- Speed up syntax
    vim.cmd('set syntax=diff')
    vim.cmd('set wrap') -- Lines wrap to following lines
    vim.cmd('set nolist') -- Do not display whitespace
else
    vim.cmd('set nowrap') -- Display long lines as just one line
    vim.cmd('set list') -- Do not display whitespace
end

-- Define text abbreviations
vim.cmd('iabbrev waht what')
vim.cmd('iabbrev Vari Variables')
vim.cmd('iabbrev teh the')
vim.cmd('iabbrev tehn then')
vim.cmd('iabbrev Req Request')
vim.cmd('iabbrev fb foobar')
vim.cmd('iabbrev Attr Attributes')
vim.cmd('iabbrev Appl Application')
vim.cmd('iabbrev adn and')
--
-- -- Ignore CamelCase words when spell checking
vim.cmd([[
  function! IgnoreCamelCaseSpell()
    syn match CamelCase /\\<\\u\\l\\+\\u\\l.\\{-}\\>/ contains=@NoSpell transparent
    syn cluster Spell add=CamelCase
  endfunction
  autocmd BufRead,BufNewFile * :call IgnoreCamelCaseSpell()
]])
--
-- -- Copy to clipboard with <Ctrl-c> and yy, paste with <Shift-Insert>
vim.cmd([[
  vmap <C-c> y:call system("xclip -i -selection clipboard", getreg("\""))<CR>:call system("xclip -i", getreg("\""))<CR>
  vmap yy    y:call system("xclip -i -selection clipboard", getreg("\""))<CR>:call system("xclip -i", getreg("\""))<CR>
]])
