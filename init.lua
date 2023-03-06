-- disable netrw at the very start of your init.lua (strongly advised)
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

require "user.options"
require "user.plugins"
require "user.keymaps"
require "user.colorscheme"
require "user.cmp"
require "user.lsp"
require "user.telescope"
require "user.gitsigns"
require "user.treesitter"
require "user.autopairs"
require "user.comment"
require "user.nvimtree"
require "user.bufferline"
require "user.lualine"
require "user.toggleterm"
require "user.project"
require "user.indentline"
require "user.alpha"
require "user.whichkey"
require "user.autocommands"
require "user.illuminate"
require "user.impatient"
require "user.jaq"
require "user.tmux-navigation"
require "user.colorizer"
require "user.neoscroll"
require "user.bqf"
require "user.mellifluous"
require "user.signature"
require "user.numb"
require "user.matchup"
require "user.neogen"
require "user.docs-view"
require "user.peek"
require "config.user_colors"

vim.cmd('source ~/.config/nvim/lua/config/user_keys.vim')
vim.cmd('source ~/.config/nvim/lua/config/user.vim')
require("luasnip/loaders/from_vscode").load { paths = { "~/.config/nvim/lua/snippets" } }
