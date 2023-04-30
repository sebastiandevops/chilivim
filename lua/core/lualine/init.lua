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

local auto_theme_ok, auto_theme_custom = pcall(require, "lualine.themes.auto")
if not auto_theme_ok then
  return
end

-- Transparent background color for lualine
auto_theme_custom.normal.c.bg = "none"

lualine.setup({
	options = {
    globalstatuses = true,
		icons_enabled = true,
		theme = auto_theme_custom, -- or you can change this to colors.theme and customize your colors under colors.lua file.
		component_separators = { left = "", right = "" },
		section_separators = { left = "", right = "" },
		disabled_filetypes = { "alpha", "dashboard" },
		always_divide_middle = true,
	},
	sections = {
		lualine_a = { 'branch' },
    lualine_b = { 'mode', components.python_env, 'diff' },
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
