return {
  compile = false,             -- enable compiling the colorscheme
  undercurl = true,            -- enable undercurls
  commentStyle = { italic = true },
  functionStyle = {},
  keywordStyle = { italic = true},
  statementStyle = { bold = true },
  typeStyle = {},
  transparent = true,         -- do not set background color
  dimInactive = true,         -- dim inactive window `:h hl-NormalNC`
  terminalColors = true,       -- define vim.g.terminal_color_{0,17}
  colors = {                   -- add/modify theme and palette colors
      palette = {},
      theme = { wave = {}, lotus = {}, dragon = {}, all = {} },
  },
  overrides = function(colors) -- add/modify highlights
    local theme = colors.theme
    return {
      NormalFloat = { bg = "none" },
      FloatBorder = { bg = "none" },
      FloatTitle = { bg = "none" },

      -- Save an hlgroup with dark background and dimmed foreground
      -- so that you can use it where your still want darker windows.
      -- E.g.: autocmd TermOpen * setlocal winhighlight=Normal:NormalDark
      NormalDark = { fg = theme.ui.fg_dim, bg = "none" },

      -- Popular plugins that open floats will link to NormalFloat by default;
      -- set their background accordingly if you wish to keep them dark and borderless
      LazyNormal = { bg = "none", fg = theme.ui.fg_dim },
      MasonNormal = { bg = "none", fg = theme.ui.fg_dim },
    }
  end,
  theme = "dragon",              -- Load "wave" theme when 'background' option is not set
  background = {               -- map the value of 'background' option to a theme
      dark = "dragon",           -- try "dragon" !
      light = "lotus"
  },
}
