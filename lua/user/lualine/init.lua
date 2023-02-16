local status_ok, lualine = pcall(require, "lualine")
if not status_ok then
	return
end

local colors = require "user.lualine.colors"

local python_env = function()
  local utils = require "user.lualine.utils"
  if vim.bo.filetype == "python" then
    local venv = os.getenv "CONDA_DEFAULT_ENV" or os.getenv "VIRTUAL_ENV"
    if venv then
      local icons = require "nvim-web-devicons"
      local py_icon, _ = icons.get_icon ".py"
      return string.format(" " .. py_icon .. " (%s)", utils.env_cleanup(venv))
    end
  end
  return ""
end

local lsp_server = function(msg)
  local buf_clients = vim.lsp.buf_get_clients()
  if next(buf_clients) == nil then
    -- TODO: clean up this if statement
    if type(msg) == "boolean" or #msg == 0 then
      return "LS Inactive"
    end
    return msg
  end
  local buf_client_names = {}

  -- add client
  for _, client in pairs(buf_clients) do
    if client.name ~= "null-ls" and client.name ~= "copilot" then
      table.insert(buf_client_names, client.name)
    end
  end
  local unique_client_names = vim.fn.uniq(buf_client_names)
  local language_servers = "[" .. table.concat(unique_client_names, ", ") .. "]"
  return language_servers
end

local spaces = function()
	return "spaces: " .. vim.api.nvim_buf_get_option(0, "shiftwidth")
end

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
		lualine_b = { 'mode', 'diff', python_env},
		lualine_c = {},
		-- lualine_x = { "encoding", "fileformat", "filetype" },
		lualine_x = { lsp_server, spaces, 'filetype' },
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
