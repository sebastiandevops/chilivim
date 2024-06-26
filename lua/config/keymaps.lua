local opts = { noremap = true, silent = true }

local term_opts = { silent = true }

-- Shorten function name
local keymap = vim.api.nvim_set_keymap
local vimkeymap = vim.keymap.set

--Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
-- vim.g.mapleader = " "
-- vim.g.maplocalleader = ","

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- Normal --
-- Better window navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

-- Resize with arrows
keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- Vertical splitter
keymap("n", "<leader>v", ":vsplit<CR>", opts)

-- Navigate buffers
keymap("n", "<S-l>", ":bnext<CR>", opts)
keymap("n", "<S-h>", ":bprevious<CR>", opts)

-- keymap for easy navigation through tabs
keymap("n", "<TAB>",   ":bnext<CR>", opts)
keymap("n", "<S-TAB>", ":bprevious<CR>", opts)
keymap("n", "<S-h>",   ":bprevious<CR>", opts)
keymap("n", "<S-l>",   ":bnext<CR>", opts)

-- Make current file executable using Eunuch.
-- keymap('n', '<A-e>', [[:!chmod u+x %<CR>:set filetype=sh<CR>:echo "File is now executable!"<CR>]], opts)
-- keymap('n', '<A-e>', [[:!chmod u+x %<CR>:set filetype=py<CR>:echo "File is now executable!"<CR>]], opts)

-- Snippets.
keymap('n', 'sl', ':call SnippetList()<CR>', opts)
keymap('n', 'sL', ':LuaSnipListAvailable<CR>', opts)
keymap('n', 'ss', ':call SnippetSave()<CR>', opts)
keymap('n', 'se', ':call SnippetEdit()<CR>', opts)
keymap('n', 'ge', ':call DeleteEndingWhiteSpace()<CR>', opts)

-- Saves a few key presses.
-- nnoremap ; :
keymap('n', ';', ':', {})

-- Run macro q with just typing Q.
keymap('n', 'Q', '@q', opts)

-- Keymap to open or close folds with F2
keymap('n', '<F2>', 'za', opts)

keymap('n', '<A-j>', ':m .+1<CR>==', opts)
keymap('n', '<A-k>', ':m .-2<CR>==', opts)
keymap('i', '<A-j>', '<Esc>:m .+1<CR>==gi', {})
keymap('i', '<A-k>', '<Esc>:m .-2<CR>==gi', {})
keymap('v', '<A-j>', ":m '>+1<CR>gv=gv", opts)
keymap('v', '<A-k>', ":m '<-2<CR>gv=gv", opts)

-- Function keys.
keymap('n', '<F4>', ':NvimTreeToggle<CR>', opts)
-- F5 reserved for kitty, open selected.
-- Use to replace last :s command on a range
-- * = last range.
-- & = last s/foo/bar/
keymap('n', '<F6>', ':*&<CR>', opts)
-- Diff current buffer and the next.
keymap('n', '<F7>', ':vsplit<CR>:bnext<CR>:windo diffthis<CR>', opts)
keymap('n', '<F8>', ':Jaq<CR>', opts)
keymap('n', '<F9>', ':Telescope find_files<CR>', opts)
-- F10 reserved for kitty, open new terminal.
-- F11 reserved for kitty, full screen.
keymap('n', '<F12>', ':SymbolsOutline<CR>', opts)

-- Visual --
-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Visual Block --
-- Move text up and down
keymap("x", "J", ":move '>+1<CR>gv-gv", opts)
keymap("x", "K", ":move '<-2<CR>gv-gv", opts)
keymap("x", "<A-j>", ":move '>+1<CR>gv-gv", opts)
keymap("x", "<A-k>", ":move '<-2<CR>gv-gv", opts)

-- Comment
keymap("n", "<leader>/", "<cmd>lua require('Comment.api').toggle.linewise.current()<CR>", opts)
keymap("x", "<leader>/", "<esc><cmd>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<CR>", opts)

-- Search & Replace
-- <C-s> will replace the current word under the cursor and send the word to search registers, so I can press n to search for the next word and press . to repeat the changes.
vimkeymap('n', '<C-s>', function()
    vim.api.nvim_command 'norm! yiw'
    vim.fn.setreg('/', vim.fn.getreg '+')
    vim.api.nvim_feedkeys('ciw', 'n', false)
end, { desc = 'Search & Replace' })
-- Press <C-s> in visual mode will do the same but replace and search the current visual area.
keymap('v', '<C-s>', [[y/\V<C-R>=escape(@",'/\')<CR><CR>Ncgn]], opts)

-- redirect to a popup focused window the messages generated by a command
vimkeymap("c", "<S-Enter>", function()
  require("noice").redirect(vim.fn.getcmdline())
  end, { desc = "Redirect Cmdline" })


-- Create a command alias for CopilotChat
vim.cmd("command! -nargs=1 CC lua require('config.functions').copilot_chat_with_text(<q-args>)")
