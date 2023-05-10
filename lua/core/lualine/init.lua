local status_ok, lualine = pcall(require, "lualine")
if not status_ok then
	return
end

local components_ok, components = pcall(require, "core.lualine.components")
if not components_ok then
  return
end

local colors_ok, colors = pcall(require, "core.lualine.colors")
if not colors_ok then
  return
end

local auto_theme_ok, auto_theme_custom = pcall(require, "lualine.themes.horizon")
if not auto_theme_ok then
  return
end

-- Transparent background color for lualine
auto_theme_custom.normal.c.bg = "none"
auto_theme_custom.visual.c.bg = "none"
auto_theme_custom.insert.c.bg = "none"
auto_theme_custom.command.c.bg = "none"

lualine.setup({
	options = {
    globalstatuses = true,
		icons_enabled = true,
		theme = auto_theme_custom, -- Choose between "auto", "auto_theme_custom" for transparent components or use colors.theme and customize your colors under colors.lua file.
		component_separators = { left = "", right = "" },
		section_separators = { left = "", right = "" }, -- "","","","","",""
		disabled_filetypes = { "alpha", "dashboard" },
		always_divide_middle = true,
	},
	sections = {
		lualine_a = { 'mode' },
    lualine_b = { 'branch', components.python_env, 'diff' },
		lualine_c = { 'filename' },
		lualine_x = { 'diagnostics', components.lsp, components.fileformat,
      components.spaces, 'filetype' },
		lualine_y = { 'location' },
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
	extensions = {},
})
