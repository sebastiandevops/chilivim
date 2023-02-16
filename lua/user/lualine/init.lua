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
		theme = {
      normal = {
        c = { fg = colors.medium, bg = colors.red,  gui = "bold" },
        a = { fg = colors.grey,   bg = colors.pine, gui = "bold" },
        b = { fg = colors.medium, bg = colors.red,  gui = "bold" },
        x = { fg = colors.medium, bg = colors.red,  gui = "bold" },
        y = { fg = colors.medium, bg = colors.red,  gui = "bold" },
        z = { fg = colors.grey,   bg = colors.pine, gui = "bold" },
      },
      visual = {
        c = { fg = colors.medium, bg = colors.red,  gui = "bold" },
        a = { fg = colors.grey,   bg = colors.iris, gui = "bold" },
        b = { fg = colors.medium, bg = colors.red,  gui = "bold" },
        x = { fg = colors.medium, bg = colors.red,  gui = "bold" },
        y = { fg = colors.medium, bg = colors.red,  gui = "bold" },
        z = { fg = colors.grey,   bg = colors.iris, gui = "bold" },
      },
      insert = {
        c = { ft = colors.medium, bg = colors.red,  gui = "bold" },
        a = { fg = colors.grey,   bg = colors.love, gui = "bold" },
        b = { fg = colors.medium, bg = colors.red,  gui = "bold" },
        x = { fg = colors.medium, bg = colors.red,  gui = "bold" },
        y = { fg = colors.medium, bg = colors.red,  gui = "bold" },
        z = { fg = colors.grey,   bg = colors.love, gui = "bold" },
      },
      inactive = {
        c = { fg = colors.medium, bg = colors.red,  gui = "bold" },
        a = { fg = colors.grey,   bg = colors.deep, gui = "bold" },
        b = { fg = colors.medium, bg = colors.red,  gui = "bold" },
        x = { fg = colors.medium, bg = colors.red,  gui = "bold" },
        y = { fg = colors.medium, bg = colors.red,  gui = "bold" },
        z = { fg = colors.grey,   bg = colors.deep, gui = "bold" },
      },
      command = {
        c = { fg = colors.medium, bg = colors.red,  gui = "bold" },
        a = { fg = colors.grey,   bg = colors.deep, gui = "bold" },
        b = { fg = colors.medium, bg = colors.red,  gui = "bold" },
        x = { fg = colors.medium, bg = colors.red,  gui = "bold" },
        y = { fg = colors.medium, bg = colors.red,  gui = "bold" },
        z = { fg = colors.grey,   bg = colors.deep, gui = "bold" },
      },
      replace = {
        c = { fg = colors.medium, bg = colors.red,  gui = "bold" },
        a = { fg = colors.grey,   bg = colors.deep, gui = "bold" },
        b = { fg = colors.medium, bg = colors.red,  gui = "bold" },
        x = { fg = colors.medium, bg = colors.red,  gui = "bold" },
        y = { fg = colors.medium, bg = colors.red,  gui = "bold" },
        z = { fg = colors.grey,   bg = colors.deep, gui = "bold" },
      },
    },
		component_separators = { left = "", right = "" },
		section_separators = { left = "", right = "" },
		disabled_filetypes = { "alpha", "dashboard" },
		always_divide_middle = true,
	},
	sections = {
		lualine_a = { 'branch', 'diagnostics' },
		lualine_b = { 'mode', 'diff', components.python_env},
		lualine_c = {},
		-- lualine_x = { "encoding", "fileformat", "filetype" },
		lualine_x = { components.lsp, components.spaces, 'filetype' },
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
