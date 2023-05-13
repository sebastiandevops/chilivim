M = {}

M.colors = {
  medium      = '#a09abc',
  grey        = '#383f51',
  highlight   = '#44415a',
  transparent = '#0000ffff',
  pine        = '#d7af87',
  deep        = '#7cdce7',
  iris        = '#87afd7',
  love        = '#e95378',
  white       = '#e0def4',
}

M.theme = {
  normal = {
    c = { fg = M.colors.medium, bg = M.colors.transparent,  gui = "bold" },
    a = { fg = M.colors.grey,   bg = M.colors.pine,         gui = "bold" },
    b = { fg = M.colors.medium, bg = M.colors.grey,         gui = "bold" },
    x = { fg = M.colors.medium, bg = M.colors.transparent,  gui = "bold" },
    y = { fg = M.colors.medium, bg = M.colors.grey,         gui = "bold" },
    z = { fg = M.colors.grey,   bg = M.colors.pine,         gui = "bold" },
  },
  visual = {
    c = { fg = M.colors.medium, bg = M.colors.transparent,  gui = "bold" },
    a = { fg = M.colors.grey,   bg = M.colors.iris,         gui = "bold" },
    b = { fg = M.colors.medium, bg = M.colors.grey,         gui = "bold" },
    x = { fg = M.colors.medium, bg = M.colors.transparent,  gui = "bold" },
    y = { fg = M.colors.medium, bg = M.colors.grey,         gui = "bold" },
    z = { fg = M.colors.grey,   bg = M.colors.iris,         gui = "bold" },
  },
  insert = {
    c = { ft = M.colors.medium, bg = M.colors.transparent,  gui = "bold" },
    a = { fg = M.colors.grey,   bg = M.colors.love,         gui = "bold" },
    b = { fg = M.colors.medium, bg = M.colors.grey,         gui = "bold" },
    x = { fg = M.colors.medium, bg = M.colors.transparent,  gui = "bold" },
    y = { fg = M.colors.medium, bg = M.colors.grey,         gui = "bold" },
    z = { fg = M.colors.grey,   bg = M.colors.love,         gui = "bold" },
  },
  inactive = {
    c = { fg = M.colors.medium, bg = M.colors.transparent,  gui = "bold" },
    a = { fg = M.colors.grey,   bg = M.colors.deep,         gui = "bold" },
    b = { fg = M.colors.medium, bg = M.colors.grey,         gui = "bold" },
    x = { fg = M.colors.medium, bg = M.colors.transparent,  gui = "bold" },
    y = { fg = M.colors.medium, bg = M.colors.grey,         gui = "bold" },
    z = { fg = M.colors.grey,   bg = M.colors.deep,         gui = "bold" },
  },
  command = {
    c = { fg = M.colors.medium, bg = M.colors.transparent,  gui = "bold" },
    a = { fg = M.colors.grey,   bg = M.colors.deep,         gui = "bold" },
    b = { fg = M.colors.medium, bg = M.colors.grey,         gui = "bold" },
    x = { fg = M.colors.medium, bg = M.colors.transparent,  gui = "bold" },
    y = { fg = M.colors.medium, bg = M.colors.grey,         gui = "bold" },
    z = { fg = M.colors.grey,   bg = M.colors.deep,         gui = "bold" },
  },
  replace = {
    c = { fg = M.colors.medium, bg = M.colors.transparent,  gui = "bold" },
    a = { fg = M.colors.grey,   bg = M.colors.love,         gui = "bold" },
    b = { fg = M.colors.medium, bg = M.colors.grey,         gui = "bold" },
    x = { fg = M.colors.medium, bg = M.colors.transparent,  gui = "bold" },
    y = { fg = M.colors.medium, bg = M.colors.grey,         gui = "bold" },
    z = { fg = M.colors.grey,   bg = M.colors.love,         gui = "bold" },
  },
}

return M
