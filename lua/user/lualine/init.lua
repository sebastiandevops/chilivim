local status_ok, lualine = pcall(require, "lualine")
if not status_ok then
	return
end

local components = require "user.lualine.components"
local colors = require "user.lualine.colors"

lualine.setup({
	options = {
    globalstatuses = true,
		icons_enabled = true,
		theme = colors.theme,
		component_separators = { left = "", right = "" },
		section_separators = { left = "", right = "" },
		disabled_filetypes = { "alpha", "dashboard" },
		always_divide_middle = true,
	},
	sections = {
		lualine_a = { 'branch' },
    lualine_b = { 'mode', components.python_env, components.diff },
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
