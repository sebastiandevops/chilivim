-- Config {{{1
local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
	PACKER_BOOTSTRAP = fn.system({
		"git",
		"clone",
		"--depth",
		"1",
		"https://github.com/wbthomason/packer.nvim",
		install_path,
	})
	print("Installing packer close and reopen Neovim...")
	vim.cmd([[packadd packer.nvim]])
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
	return
end

-- Have packer use a popup window
packer.init({
	display = {
		open_fn = function()
			return require("packer.util").float({ border = "rounded" })
		end,
	},
})
-- }}}1

-- Plugins {{{1
-- Install your plugins here
return packer.startup(function(use)
  use { "wbthomason/packer.nvim" } -- Have packer manage itself
  use { "nvim-lua/plenary.nvim" } -- Useful lua functions used by lots of plugins
  use { "windwp/nvim-autopairs" } -- Autopairs, integrates with both cmp and treesitter
  use { "numToStr/Comment.nvim" }
  use { "JoosepAlviste/nvim-ts-context-commentstring" }
  use { "kyazdani42/nvim-web-devicons" }
  use { "kyazdani42/nvim-tree.lua" }
  use { "akinsho/bufferline.nvim" }
  use { "moll/vim-bbye" }
  use { "nvim-lualine/lualine.nvim" }
  use { "akinsho/toggleterm.nvim" }
  use { "ahmedkhalf/project.nvim" }
  use { "lewis6991/impatient.nvim" }
  use { "lukas-reineke/indent-blankline.nvim" }
  use { "goolord/alpha-nvim" }
  use {"folke/which-key.nvim"}
  use {'jdhao/better-escape.vim', event = 'InsertEnter'}
    -- Personal
  -- multicursor
  use { "mg979/vim-visual-multi" }
  -- TroubleDiagnostics
  use {
    "folke/trouble.nvim",
    cmd = "TroubleToggle",
  }
  -- Markers in margin. 'ma' adds marker
  use {
    "kshenoy/vim-signature",
    event = "BufRead",
  }
  -- lsp_signature.nvim
  -- hint when you type
  use {
    "ray-x/lsp_signature.nvim",
    event = "BufRead",
    config = function()
      require "lsp_signature".setup({
        floating_window = false,
        hint_enable = true,
      })
    end
  }
  -- codi.vim
  -- interactive scratchpad for hackers
  use {
    "metakirby5/codi.vim",
    cmd = "Codi",
  }
  -- symbols-outline.nvim - F12
  -- a tree like view for symbols
  use {
    "simrat39/symbols-outline.nvim",
    cmd = "SymbolsOutline",
  }

  -- Highlight URL's. http://www.vivaldi.com
  use {
    "itchyny/vim-highlighturl",
    event = "BufRead",
  }

  -- Kitty config syntax.  Edit kitty, with vk
  use {
    "fladson/vim-kitty",
    event = "BufRead",
    ft = "conf",
  }

  -- Dev docs
  use {
    "rhysd/devdocs.vim"
  }

  -- Vim syntax file for Docker's Dockerfile and snippets for snipMate.
  use {
    'ekalinin/Dockerfile.vim'
  }
  -- numb
  -- jump to the line
  use {
    "nacro90/numb.nvim",
    event = "BufRead",
    config = function()
      require("numb").setup {
        show_numbers = true, -- Enable 'number' for the window while peeking
        show_cursorline = true, -- Enable 'cursorline' for the window while peeking
      }
    end,
  }
  -- nvim-bqf
  -- better quickfix window
  use {
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
  }
  -- vim-matchup
  -- navigate and highlight matching words
  use {
    "andymass/vim-matchup",
    event = "CursorMoved",
    config = function()
      vim.g.matchup_matchparen_offscreen = { method = "popup" }
    end,
  }

  -- Git
  -- diffview
  -- git diff in a single tabpage
  use {
    "sindrets/diffview.nvim",
    event = "BufRead",
  }

  -- git-blame
  -- show git blame
  use {
    "f-person/git-blame.nvim",
    event = "BufRead",
    config = function()
      vim.cmd "highlight default link gitblame SpecialComment"
      vim.g.gitblame_enabled = 0
    end,
  }
  -- rainbow parentheses
  use { "p00f/nvim-ts-rainbow" }
  -- neoscroll
  use {
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
  }
  -- LazyGit plugin
  use { "kdheepak/lazygit.nvim" }
  use { "sbdchd/neoformat" }
  use {
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
  }
  use { "alexghergh/nvim-tmux-navigation", config = function()

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
  }
  use {
    "VonHeikemen/searchbox.nvim",
    requires = {
      {"MunifTanjim/nui.nvim"}
    }
  }
  --  plugin shows a lightbulb in the sign column whenever a textDocument/codeAction is available at the current cursor position.
  use { "kosayoda/nvim-lightbulb",
    requires = {
       {'antoinemadec/FixCursorHold.nvim'}
    }
  }
  use { "RishabhRD/nvim-cheat.sh" }
  use { "RishabhRD/popfix" }
  use {
    "danymat/neogen",
    config = function()
      require('neogen').setup {}
    end,
    requires = "nvim-treesitter/nvim-treesitter",
    -- Uncomment next line if you want to follow only stable versions
    -- tag = "*"
  }
  -- Neovim plugin to open documentation in bottom window
  use {
    "amrbashir/nvim-docs-view",
    lazy = true,
    cmd = { "DocsViewToggle" },
    config = function()
      require("docs-view").setup {
        position = "bottom",
        hight = 10,
      }
    end,
  }
  -- Code runner
  use {
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
  }
  -- hignlight chunk signcolumn plug of nvim
  use { "yaocccc/nvim-hlchunk" }
  use { "mfussenegger/nvim-jdtls" }
	-- Colorschemes
  use { "folke/tokyonight.nvim", commit = "66bfc2e8f754869c7b651f3f47a2ee56ae557764" }
  use { "lunarvim/darkplus.nvim", commit = "13ef9daad28d3cf6c5e793acfc16ddbf456e1c83" }
  use {
    'ramojus/mellifluous.nvim',
    requires = {'rktjmp/lush.nvim'},
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
  }
	-- Cmp
  use { "hrsh7th/nvim-cmp" } -- The completion plugin
  use { "hrsh7th/cmp-buffer" } -- buffer completions
  use { "hrsh7th/cmp-path" } -- path completions
	use { "saadparwaiz1/cmp_luasnip" } -- snippet completions
	use { "hrsh7th/cmp-nvim-lsp" }
	use { "hrsh7th/cmp-nvim-lua" }
    use {'tzachar/cmp-tabnine', run='./install.sh', requires = 'hrsh7th/nvim-cmp'}

	-- Snippets
  use { "L3MON4D3/LuaSnip" } --snippet engine
  use { "rafamadriz/friendly-snippets" } -- a bunch of snippets to use

	-- LSP
	use { "neovim/nvim-lspconfig" } -- enable LSP
  use { "williamboman/mason.nvim" } -- simple to use language server installer
  use { "williamboman/mason-lspconfig.nvim" }
	use {
        "jose-elias-alvarez/null-ls.nvim",
        config = function()
            require("null-ls").setup()
        end,
        requires = { "nvim-lua/plenary.nvim" },
    } -- for formatters and linters
  use { "RRethy/vim-illuminate" }

	-- Telescope
	use { "nvim-telescope/telescope.nvim" }

	-- Treesitter
	use { "nvim-treesitter/nvim-treesitter"	}

	-- Git
	use { "lewis6991/gitsigns.nvim" }
-- }}}1

-- Plugins Config {{{1
vim.keymap.set({ 'n' }, '<C-k>', function()       require('lsp_signature').toggle_float_win()
end, { silent = true, noremap = true, desc = 'toggle signature' })

vim.keymap.set({ 'n' }, '<Leader>k', function()
 vim.lsp.buf.signature_help()
end, { silent = true, noremap = true, desc = 'toggle signature' })


-- }}}1

-- Automatic setup {{{1 
	-- Automatically set up your configuration after cloning packer.nvim
	-- Put this at the end after all plugins
	if PACKER_BOOTSTRAP then
		require("packer").sync()
	end
end)
-- }}}1
