return {
  -- THEMES
  -- lazy=false and priority=1000 should be used
  -- just in the colorscheme that you are currently using.
  { "sebastiandevops/horizon84.nvim", version = "", lazy = true },
  { "sebastiandevops/chili.nvim", version = "", lazy = true },
  { "projekt0n/github-nvim-theme", lazy = false, priority = 1000 },
   -- End THEMES

  { "nvim-lua/plenary.nvim" }, -- Useful lua functions used by lots of plugins
  { "windwp/nvim-autopairs" }, -- Autopairs, integrates with both cmp and treesitter
  { "windwp/nvim-ts-autotag" }, -- Use treesitter to autoclose and autorename html tag
  { "numToStr/Comment.nvim", lazy = true }, -- Smart and Powerful commenting plugin for neovim
  { "JoosepAlviste/nvim-ts-context-commentstring" }, -- setting the commentstring option based on the cursor location in the file
  {
    "nvim-tree/nvim-tree.lua",
    version = "*",
    lazy = false,
    config = function()
      local options = require("core.nvimtree.options")
      options.presettings()
      require("nvim-tree").setup(options.config)
    end,
  }, -- A File Explorer For Neovim Written In Lua.
  -- { "akinsho/bufferline.nvim" }, --  snazzy buffer line (with tabpage integration) for Neovim
  { "willothy/nvim-cokeline" },
  { "nvim-lualine/lualine.nvim", dependencies = { "nvim-tree/nvim-web-devicons", lazy = true } }, -- neovim statusline plugin
  { "numToStr/FTerm.nvim" }, -- No-nonsense floating terminal plugin for neovim
  { "ahmedkhalf/project.nvim", lazy = true }, -- Provides project management functionality
  { "lukas-reineke/indent-blankline.nvim", main = "ibl" }, -- adds indentation guides to all lines (including empty lines)
  { "goolord/alpha-nvim" }, -- Init dashboard for neovim
  { "folke/which-key.nvim", lazy = true }, -- Displays a popup with possible key bindings of the command you started typing
  { "jdhao/better-escape.vim", event = "InsertEnter",}, -- escape insert mode quickly using jk
  { "mg979/vim-visual-multi" }, -- multicursor
  { "folke/trouble.nvim", cmd = "TroubleToggle", }, -- TroubleDiagnostics
  { "kshenoy/vim-signature", event = "BufRead", }, -- Markers in margin. 'ma' adds marker
  { "ray-x/lsp_signature.nvim", event = "BufRead"  }, -- hint when you type
  { "simrat39/symbols-outline.nvim", cmd = "SymbolsOutline", }, -- a tree like view for symbols
  { "ekalinin/Dockerfile.vim", event = "BufEnter Dockerfile"}, -- Vim syntax file for Docker's Dockerfile and snippets for snipMate.
  { "nacro90/numb.nvim", event = "BufRead", }, -- jump to the line
  { "kevinhwang91/nvim-bqf", event = { "BufRead", "BufNew" }, }, -- better quickfix window
  { "andymass/vim-matchup", event = "CursorMoved", }, -- navigate and highlight matching words
  { "sindrets/diffview.nvim", event = "BufRead", }, -- git diff in a single tabpage
  { "f-person/git-blame.nvim", event = "BufRead", }, -- show git blame
  { "karb94/neoscroll.nvim", event = "WinScrolled" }, -- smooth scrolling neovim plugin written in lua
  { "kdheepak/lazygit.nvim" }, -- simple terminal UI for git commands, written in Go
  { "sbdchd/neoformat" }, --  variety of formatters for many filetypes
  { "norcalli/nvim-colorizer.lua" }, -- high-performance color highlighter for Neovim which has no external dependencies
  { "alexghergh/nvim-tmux-navigation" }, -- plugin that allows you to navigate seamlessly between vim and tmux splitsusing
  { "RishabhRD/nvim-cheat.sh", cmd = {"Cheat"} }, -- cheat.sh integration for neovim
  { "RishabhRD/popfix" }, -- API that helps plugin developers to write UI for their plugins easily
  { "danymat/neogen", cmd = { "Neogen" }, config = true, },
  { "amrbashir/nvim-docs-view", lazy = true, cmd = { "DocsViewToggle" }, }, -- Neovim plugin to open documentation in bottom window
  { "is0n/jaq-nvim", lazy = true }, -- Code runner
  { "mfussenegger/nvim-jdtls", lazy = true, event = "BufEnter *.java" }, -- Extensions for the built-in Language Server Protocol support in Neovim
  -- Cmp
  { "hrsh7th/nvim-cmp" }, -- The completion plugin
  { "hrsh7th/cmp-buffer" }, -- buffer completions
  { "hrsh7th/cmp-path" }, -- path completions
  { "saadparwaiz1/cmp_luasnip" }, -- snippet completions
  { "hrsh7th/cmp-nvim-lsp" }, -- completion engine
  { "hrsh7th/cmp-nvim-lua" },  -- completion engine
  { "tzachar/cmp-tabnine", build = "./install.sh" },
  -- Snippets
  { "L3MON4D3/LuaSnip" }, --snippet engine
  { "rafamadriz/friendly-snippets" }, -- a bunch of snippets to use
  -- LSP
  { "neovim/nvim-lspconfig" }, -- enable LSP
  { "williamboman/mason.nvim" }, -- simple to use language server installer
  { "williamboman/mason-lspconfig.nvim" }, -- mason-lspconfig bridges mason.nvim with the lspconfig plugin.
  { "nvimtools/none-ls.nvim" }, -- for formatters and linters
  {
    "jay-babu/mason-null-ls.nvim",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      require("core.lsp.null-ls.mason-null-ls") -- require your null-ls config here (example below)
    end,
  },
  { "RRethy/vim-illuminate" }, -- plugin for automatically highlighting other uses of the word under the cursor
  { "nvim-telescope/telescope.nvim" }, -- Telescope
  { "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" }, -- provide a simple and easy way to use the interface for tree-sitter in Neovim
  { "lewis6991/gitsigns.nvim" }, -- git decorations implemented purely in lua/teal
  { "nvim-treesitter/playground", cmd = { "TSHighlightCapturesUnderCursor" } }, -- View treesitter information directly in Neovim
  { "xiyaowong/nvim-transparent" }, -- Remove all background colors to make nvim transparent
  { "weilbith/nvim-code-action-menu", cmd = "CodeActionMenu" }, -- The plugin has a single command only: CodeActionMenu
  { "b0o/schemastore.nvim" },
  { "duane9/nvim-rg" }, -- run ripgrep from Neovim or Vim and shows the results in a quickfix window.
  {
    "preservim/vim-pencil",
    lazy = false,
    config = function()
      require("core.vim-pencil").setup()
    end,
  }, -- For editing prose-oriented file types such as text, markdown, mail, rst, tex, textile, and asciidoc.
  { "moll/vim-bbye" }, -- Bbye allows you to do delete buffers (close files) without closing your windows or messing up your layout.
  { "nvim-neorg/neorg", build = ":Neorg sync-parsers", dependencies = "nvim-neorg/neorg-telescope" },
  { "utilyre/barbecue.nvim", name = "barbecue", version = "*", dependencies = "SmiteshP/nvim-navic" },
  { "folke/noice.nvim", event = "VeryLazy", dependencies = { "MunifTanjim/nui.nvim", "rcarriga/nvim-notify" } },
  { "someone-stole-my-name/yaml-companion.nvim" },
  { "wakatime/vim-wakatime" },

  -- Copilot plugins
  { "zbirenbaum/copilot.lua", cmd = "Copilot", event = "InsertEnter" },
  {
    "zbirenbaum/copilot-cmp",
    config = function()
        require("copilot_cmp").setup()
    end,
  },
  { 'AndreM222/copilot-lualine' },
}
