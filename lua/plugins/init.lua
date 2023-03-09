return {
  -- THEMES
  { 'ramojus/mellifluous.nvim', dependencies = {'rktjmp/lush.nvim'}, }, -- Colorschemes
  { "rebelot/kanagawa.nvim" },
  { 'marko-cerovac/material.nvim' },
  { 'nyoom-engineering/oxocarbon.nvim' },
  { "sainnhe/gruvbox-material" },
  { "Yazeed1s/minimal.nvim" },
  { "catppuccin/nvim", name = "catppuccin" },
   -- End THEMES 
  "nvim-lua/plenary.nvim", -- Useful lua functions used by lots of plugins
  "windwp/nvim-autopairs", -- Autopairs, integrates with both cmp and treesitter
  "numToStr/Comment.nvim", -- Smart and Powerful commenting plugin for neovim
  "JoosepAlviste/nvim-ts-context-commentstring", -- setting the commentstring option based on the cursor location in the file
  "kyazdani42/nvim-web-devicons", -- A lua fork of vim-devicons. This plugin provides the same icons as well as colors for each icon
  -- { "kyazdani42/nvim-tree.lua", commit = "9c97e6449b0b0269bd44e1fd4857184dfa57bb4c" }, -- A File Explorer For Neovim Written In Lua.
  "kyazdani42/nvim-tree.lua", -- A File Explorer For Neovim Written In Lua.
  "akinsho/bufferline.nvim", --  snazzy buffer line (with tabpage integration) for Neovim
  "moll/vim-bbye", -- Bbye allows you to do delete buffers (close files) without closing your windows or messing up your layout.
  "nvim-lualine/lualine.nvim", -- neovim statusline plugin
  "akinsho/toggleterm.nvim", -- Integrated terminal
  "ahmedkhalf/project.nvim", -- Provides project management functionality
  "lewis6991/impatient.nvim", -- Speed up loading Lua modules in Neovim to improve startup time
  "lukas-reineke/indent-blankline.nvim", -- adds indentation guides to all lines (including empty lines)
  "goolord/alpha-nvim", -- Init dashboard for neovim
  "folke/which-key.nvim", -- Displays a popup with possible key bindings of the command you started typing
  {'jdhao/better-escape.vim', event = 'InsertEnter',}, -- escape insert mode quickly using jk
  "mg979/vim-visual-multi", -- multicursor
  { "folke/trouble.nvim", cmd = "TroubleToggle", }, -- TroubleDiagnostics
  { "kshenoy/vim-signature", event = "BufRead", }, -- Markers in margin. 'ma' adds marker
  { "ray-x/lsp_signature.nvim", event = "BufRead"  }, -- hint when you type
  { "metakirby5/codi.vim", cmd = "Codi", }, -- interactive scratchpad for hackers
  { "simrat39/symbols-outline.nvim", cmd = "SymbolsOutline", }, -- a tree like view for symbols
  { "itchyny/vim-highlighturl", event = "BufRead", }, -- Highlight URL's. http://www.vivaldi.com
  { "fladson/vim-kitty", event = "BufRead", ft = "conf", }, -- Kitty config syntax.  Edit kitty, with vk
  "rhysd/devdocs.vim", -- open and search devdocs from neovim
  'ekalinin/Dockerfile.vim', -- Vim syntax file for Docker's Dockerfile and snippets for snipMate.
  { "nacro90/numb.nvim", event = "BufRead", }, -- jump to the line
  { "kevinhwang91/nvim-bqf", event = { "BufRead", "BufNew" }, }, -- better quickfix window
  { "andymass/vim-matchup", event = "CursorMoved", }, -- navigate and highlight matching words
  { "sindrets/diffview.nvim", event = "BufRead", }, -- git diff in a single tabpage
  { "f-person/git-blame.nvim", event = "BufRead", }, -- show git blame
  { "p00f/nvim-ts-rainbow" }, -- rainbow parentheses
  { "karb94/neoscroll.nvim", event = "WinScrolled" }, -- smooth scrolling neovim plugin written in lua
  { "kdheepak/lazygit.nvim" }, -- simple terminal UI for git commands, written in Go
  { "sbdchd/neoformat" }, --  variety of formatters for many filetypes
  { "norcalli/nvim-colorizer.lua" }, -- high-performance color highlighter for Neovim which has no external dependencies
  { "alexghergh/nvim-tmux-navigation" }, -- plugin that allows you to navigate seamlessly between vim and tmux splitsusing 
  { "VonHeikemen/searchbox.nvim", dependencies = {"MunifTanjim/nui.nvim"} }, -- search and and replace with a small popup window
  { "RishabhRD/nvim-cheat.sh" }, -- cheat.sh integration for neovim
  { "RishabhRD/popfix" }, -- API that helps plugin developers to write UI for their plugins easily
  { "danymat/neogen", dependencies = "nvim-treesitter/nvim-treesitter", config = true, },
  { "amrbashir/nvim-docs-view", lazy = true, cmd = { "DocsViewToggle" }, }, -- Neovim plugin to open documentation in bottom window
  { "is0n/jaq-nvim" }, -- Code runner
  { "yaocccc/nvim-hlchunk" }, -- hignlight chunk signcolumn plug of nvim
  { "mfussenegger/nvim-jdtls" }, -- Extensions for the built-in Language Server Protocol support in Neovim
	-- Cmp
  { "hrsh7th/nvim-cmp" }, -- The completion plugin
  { "hrsh7th/cmp-buffer" }, -- buffer completions
  { "hrsh7th/cmp-path" }, -- path completions
	{ "saadparwaiz1/cmp_luasnip" }, -- snippet completions
	{ "hrsh7th/cmp-nvim-lsp" }, -- completion engine
	{ "hrsh7th/cmp-nvim-lua" },  -- completion engine
  {'tzachar/cmp-tabnine', build='./install.sh', dependencies = 'hrsh7th/nvim-cmp'}, -- completion engine
	-- Snippets
  { "L3MON4D3/LuaSnip" }, --snippet engine
  { "rafamadriz/friendly-snippets" }, -- a bunch of snippets to use
	-- LSP
	{ "neovim/nvim-lspconfig" }, -- enable LSP
  { "williamboman/mason.nvim" }, -- simple to use language server installer
  { "williamboman/mason-lspconfig.nvim" }, -- mason-lspconfig bridges mason.nvim with the lspconfig plugin.
	{ "jose-elias-alvarez/null-ls.nvim", dependencies = { "nvim-lua/plenary.nvim" },}, -- for formatters and linters
  { "RRethy/vim-illuminate" }, -- plugin for automatically highlighting other uses of the word under the cursor
	{ "nvim-telescope/telescope.nvim" }, -- Telescope
	{ "nvim-treesitter/nvim-treesitter"	}, -- provide a simple and easy way to use the interface for tree-sitter in Neovim
	{ "lewis6991/gitsigns.nvim" }, -- git decorations implemented purely in lua/teal
  { "nvim-treesitter/playground"}, -- View treesitter information directly in Neovim
  { "toppair/peek.nvim", build='deno task --quiet build:fast' }, -- Markdown live preview
  { "folke/twilight.nvim" },
}
