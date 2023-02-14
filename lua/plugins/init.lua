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
  {
    "folke/trouble.nvim",
    cmd = "TroubleToggle",
  },
  -- Markers in margin. 'ma' adds marker
  {
    "kshenoy/vim-signature",
    event = "BufRead",
  },
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
  {
    "metakirby5/codi.vim",
    cmd = "Codi",
  },
  -- symbols-outline.nvim - F12
  -- a tree like view for symbols
  {
    "simrat39/symbols-outline.nvim",
    cmd = "SymbolsOutline",
  },

  -- Highlight URL's. http://www.vivaldi.com
  {
    "itchyny/vim-highlighturl",
    event = "BufRead",
  },

  -- Kitty config syntax.  Edit kitty, with vk
  {
    "fladson/vim-kitty",
    event = "BufRead",
    ft = "conf",
  },

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
  {
    "kevinhwang91/nvim-bqf",
    event = { "BufRead", "BufNew" },
    config = function()
      require("bqf").setup({
        auto_enable = true,
        preview = {
          win_height = 12,
          win_vheight = 12,
          delay_syntax = 80,
          border_chars = { "┃", "┃", "━", "━", "┏", "┓", "┗", "┛", "█" },
        },
        func_map = {
          vsplit = "",
          ptogglemode = "z,",
          stoggleup = "",
        },
        filter = {
          fzf = {
            action_for = { ["ctrl-s"] = "split" },
            extra_opts = { "--bind", "ctrl-o:toggle-all", "--prompt", "> " },
          },
        },
      })
    end,
  },
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
  {
    "karb94/neoscroll.nvim",
    event = "WinScrolled",
    config = function()
      require('neoscroll').setup({
        -- All these keys will be mapped to their corresponding default scrolling animation
        mappings = { '<C-u>', '<C-d>', '<C-b>', '<C-f>',
          '<C-y>', '<C-e>', 'zt', 'zz', 'zb' },
        hide_cursor = true, -- Hide cursor while scrolling
        stop_eof = true, -- Stop at <EOF> when scrolling downwards
        use_local_scrolloff = false, -- Use the local scope of scrolloff instead of the global scope
        respect_scrolloff = false, -- Stop scrolling when the cursor reaches the scrolloff margin of the file
        cursor_scrolls_alone = true, -- The cursor will keep on scrolling even if the window cannot scroll further
        easing_function = nil, -- Default easing function
        pre_hook = nil, -- Function to run before the scrolling animation starts
        post_hook = nil, -- Function to run after the scrolling animation ends
      })
    end
  },
  -- LazyGit plugin
  { "kdheepak/lazygit.nvim" },
  { "sbdchd/neoformat" },
  {
    "norcalli/nvim-colorizer.lua",
      config = function()
        require("colorizer").setup({ "css", "scss", "html", "javascript" }, {
            names    = true,
            RGB      = true, -- #RGB hex codes
            RRGGBB   = true, -- #RRGGBB hex codes
            RRGGBBAA = true, -- #RRGGBBAA hex codes
            rgb_fn   = true, -- CSS rgb() and rgba() functions
            hsl_fn   = true, -- CSS hsl() and hsla() functions
            css      = true, -- Enable all CSS features: rgb_fn, hsl_fn, names, RGB, RRGGBB
            css_fn   = true, -- Enable all CSS *functions*: rgb_fn, hsl_fn
            mode     = 'background'
    })
    end,
  },
  { "alexghergh/nvim-tmux-navigation", config = function()

        local nvim_tmux_nav = require('nvim-tmux-navigation')

        nvim_tmux_nav.setup {
            disable_when_zoomed = true -- defaults to false
        }

        vim.keymap.set('n', "<C-h>", nvim_tmux_nav.NvimTmuxNavigateLeft)
        vim.keymap.set('n', "<C-j>", nvim_tmux_nav.NvimTmuxNavigateDown)
        vim.keymap.set('n', "<C-k>", nvim_tmux_nav.NvimTmuxNavigateUp)
        vim.keymap.set('n', "<C-l>", nvim_tmux_nav.NvimTmuxNavigateRight)
        vim.keymap.set('n', "<C-|>", nvim_tmux_nav.NvimTmuxNavigateLastActive)
        vim.keymap.set('n', "<C-Space>", nvim_tmux_nav.NvimTmuxNavigateNext)

    end
  },
  {
    "VonHeikemen/searchbox.nvim",
    dependencies = {
      {"MunifTanjim/nui.nvim"}
    }
  },
  --  plugin shows a lightbulb in the sign column whenever a textDocument/codeAction is available at the current cursor position.
  { "kosayoda/nvim-lightbulb",
    dependencies = {
       {'antoinemadec/FixCursorHold.nvim'}
    }
  },
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
  {
    "is0n/jaq-nvim",
    config = function ()
      require('jaq-nvim').setup{
      cmds = {
        -- Uses vim commands
        internal = {
          lua = "luafile %",
          vim = "source %"
        },
        -- Uses shell commands
        external = {
          markdown = "glow %",
          python   = "python3 %",
          go       = "go run %",
          sh       = "sh %",
          java     = "java %"
        }
      },
      behavior = {
        -- Default type
        default     = "float",
        -- Start in insert mode
        startinsert = false,
        -- Use `wincmd p` on startup
        wincmd      = false,
        -- Auto-save files
        autosave    = false
      },
      ui = {
        float = {
          -- See ':h nvim_open_win'
          border    = "rounded",
          -- See ':h winhl'
          winhl     = "Normal",
          borderhl  = "FloatBorder",
          -- See ':h winblend'
          winblend  = 0,
          -- Num from `0-1` for measurements
          height    = 0.8,
          width     = 0.8,
          x         = 0.5,
          y         = 0.5
        },
        terminal = {
          -- Window position
          position = "bot",
          -- Window size
          size     = 10,
          -- Disable line numbers
          line_no  = false
        },
        quickfix = {
          -- Window position
          position = "bot",
          -- Window size
          size     = 10
        }
      }
    }
    end
  },
  -- hignlight chunk signcolumn plug of nvim
  { "yaocccc/nvim-hlchunk" },
  { "mfussenegger/nvim-jdtls" },
	-- Colorschemes
  {
    'ramojus/mellifluous.nvim',
    dependencies = {'rktjmp/lush.nvim'},
    config = function()
    require 'mellifluous'.setup({
      transparent_background = {
        enabled = true,
        floating_windows = true,
        telescope = true,
        file_tree = true,
        cursor_line = true,
        status_line = true,
      },
    })
    end
  },
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
}
