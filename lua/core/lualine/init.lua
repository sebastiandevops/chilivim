local status_ok, lualine = pcall(require, "lualine")
if not status_ok then
  return
end

local components_ok, components = pcall(require, "core.lualine.components")
if not components_ok then
  return
end

local colors_ok, M = pcall(require, "core.lualine.colors")
if not colors_ok then
  return
end

local auto_theme_ok, horizon_custom = pcall(require, "lualine.themes.horizon")
if not auto_theme_ok then
  return
end

-- Transparent background color for lualine
horizon_custom.normal.a.bg = M.colors.highlight
horizon_custom.normal.a.fg = M.colors.white
horizon_custom.insert.a.bg = M.colors.love
horizon_custom.normal.c.bg = "none"
horizon_custom.visual.c.bg = "none"
horizon_custom.insert.c.bg = "none"
horizon_custom.command.c.bg = "none"

lualine.setup({
  options = {
    globalstatuses = true,
    icons_enabled = true,
    theme = horizon_custom, -- Choose between "auto", "auto_theme_custom" for transparent components or use colors.theme and customize your colors under colors.lua file.
    component_separators = {
      left = "",
      right = ""
    },
    section_separators = {
      left = "",
      right = ""
    }, -- "","","","","",""
    disabled_filetypes = {
      "alpha",
      "dashboard"
    },
    always_divide_middle = true,
  },
  sections = {
    lualine_a = { 'mode' },
    lualine_b = {
      'branch',
      components.python_env,
      'diff' },
    lualine_c = {
      {
        'filename',
        path = 1,
      },
    },
    lualine_x = {
      'diagnostics',
      components.fileformat,
      components.spaces,
      components.lsp,
      components.schema,
      'filetype',
      components.recording,
    },
    lualine_y = {
      'searchcount',
      'location'
    },
    lualine_z = { 'progress' },
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = { "filename" },
    lualine_x = { "location" },
    lualine_y = {},
    lualine_z = {},
  },
  tabline = {},
  extensions = {
    "quickfix",
    "lazy",
    "nvim-tree",
    "symbols-outline",
    "trouble",
    "man"
  },
})
