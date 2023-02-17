return {
  "nvim-lua/plenary.nvim", -- Useful lua functions used by lots of plugins
  "windwp/nvim-autopairs", -- Autopairs, integrates with both cmp and treesitter
  "numToStr/Comment.nvim",
  "JoosepAlviste/nvim-ts-context-commentstring",
  "kyazdani42/nvim-web-devicons",
  "kyazdani42/nvim-tree.lua",
  "akinsho/bufferline.nvim",
  "moll/vim-bbye",
  "nvim-lualine/lualine.nvim",
  "akinsho/toggleterm.nvim",
  "ahmedkhalf/project.nvim",
  "lewis6991/impatient.nvim",
  "lukas-reineke/indent-blankline.nvim",
  "goolord/alpha-nvim",
  "folke/which-key.nvim",
  {'jdhao/better-escape.vim', event = 'InsertEnter',},
    -- Personal
  -- multicursor
  "mg979/vim-visual-multi",
  -- TroubleDiagnostics
  { "folke/trouble.nvim", cmd = "TroubleToggle", },
  -- Markers in margin. 'ma' adds marker
  { "kshenoy/vim-signature", event = "BufRead", },
  -- lsp_signature.nvim
  -- hint when you type
  {
    "ray-x/lsp_signature.nvim",
    event = "BufRead",
    config = function()
      require "lsp_signature".setup({
        floating_window = false,
        hint_enable = true,
      })
    end
  },
  -- codi.vim
  -- interactive scratchpad for hackers
  { "metakirby5/codi.vim", cmd = "Codi", },
  -- symbols-outline.nvim - F12
  -- a tree like view for symbols
  { "simrat39/symbols-outline.nvim", cmd = "SymbolsOutline", },
  -- Highlight URL's. http://www.vivaldi.com
  { "itchyny/vim-highlighturl", event = "BufRead", },
  -- Kitty config syntax.  Edit kitty, with vk
  { "fladson/vim-kitty", event = "BufRead", ft = "conf", },
  -- Dev docs
  "rhysd/devdocs.vim",
  -- Vim syntax file for Docker's Dockerfile and snippets for snipMate.
  'ekalinin/Dockerfile.vim',
  -- numb
  -- jump to the line
  {
    "nacro90/numb.nvim",
    event = "BufRead",
    config = function()
      require("numb").setup {
        show_numbers = true, -- Enable 'number' for the window while peeking
        show_cursorline = true, -- Enable 'cursorline' for the window while peeking
      }
    end,
  },
  -- nvim-bqf
  -- better quickfix window
  { "kevinhwang91/nvim-bqf", event = { "BufRead", "BufNew" }, },
  -- vim-matchup
  -- navigate and highlight matching words
  {
    "andymass/vim-matchup",
    event = "CursorMoved",
    config = function()
      vim.g.matchup_matchparen_offscreen = { method = "popup" }
    end,
  },
  -- Git
  -- diffview
  -- git diff in a single tabpage
  {
    "sindrets/diffview.nvim",
    event = "BufRead",
  },
  -- git-blame
  -- show git blame
  {
    "f-person/git-blame.nvim",
    event = "BufRead",
    config = function()
      vim.cmd "highlight default link gitblame SpecialComment"
      vim.g.gitblame_enabled = 0
    end,
  },
  -- rainbow parentheses
  { "p00f/nvim-ts-rainbow" },
  -- neoscroll
  { "karb94/neoscroll.nvim", event = "WinScrolled" },
  -- LazyGit plugin
  { "kdheepak/lazygit.nvim" },
  { "sbdchd/neoformat" },
  { "norcalli/nvim-colorizer.lua" },
  { "alexghergh/nvim-tmux-navigation" },
  { "VonHeikemen/searchbox.nvim", dependencies = {"MunifTanjim/nui.nvim"} },
  { "RishabhRD/nvim-cheat.sh" },
  { "RishabhRD/popfix" },
  {
    "danymat/neogen",
    config = function()
      require('neogen').setup {}
    end,
    dependencies = "nvim-treesitter/nvim-treesitter",
    -- Uncomment next line if you want to follow only stable versions
    -- tag = "*"
  },
  -- Neovim plugin to open documentation in bottom window
  {
    "amrbashir/nvim-docs-view",
    lazy = true,
    cmd = { "DocsViewToggle" },
    config = function()
      require("docs-view").setup {
        position = "bottom",
        hight = 10,
      }
    end,
  },
  -- Code runner
  { "is0n/jaq-nvim" },
  -- hignlight chunk signcolumn plug of nvim
  { "yaocccc/nvim-hlchunk" },
  { "mfussenegger/nvim-jdtls" },
  -- Colorschemes
  { 'ramojus/mellifluous.nvim', dependencies = {'rktjmp/lush.nvim'}, },
	-- Cmp
  { "hrsh7th/nvim-cmp" }, -- The completion plugin
  { "hrsh7th/cmp-buffer" }, -- buffer completions
  { "hrsh7th/cmp-path" }, -- path completions
	{ "saadparwaiz1/cmp_luasnip" }, -- snippet completions
	{ "hrsh7th/cmp-nvim-lsp" },
	{ "hrsh7th/cmp-nvim-lua" },
  {'tzachar/cmp-tabnine', build='./install.sh', dependencies = 'hrsh7th/nvim-cmp'},
	-- Snippets
  { "L3MON4D3/LuaSnip" }, --snippet engine
  { "rafamadriz/friendly-snippets" }, -- a bunch of snippets to use
	-- LSP
	{ "neovim/nvim-lspconfig" }, -- enable LSP
  { "williamboman/mason.nvim" }, -- simple to use language server installer
  { "williamboman/mason-lspconfig.nvim" },
	{
        "jose-elias-alvarez/null-ls.nvim",
        config = function()
            require("null-ls").setup()
        end,
        dependencies = { "nvim-lua/plenary.nvim" },
  }, -- for formatters and linters
  { "RRethy/vim-illuminate" },
	-- Telescope
	{ "nvim-telescope/telescope.nvim" },
	-- Treesitter
	{ "nvim-treesitter/nvim-treesitter"	},
	-- Git
	{ "lewis6991/gitsigns.nvim" },
  -- Neovim Treesitter Playground
  {"nvim-treesitter/playground"}
}
