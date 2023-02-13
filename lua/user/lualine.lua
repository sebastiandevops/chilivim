local status_ok, lualine = pcall(require, "lualine")
if not status_ok then
	return
end

-- local hide_in_width = function()
-- 	return vim.fn.winwidth(0) > 80
-- end

-- local diagnostics = {
-- 	"diagnostics",
-- 	sources = { "nvim_diagnostic" },
-- 	sections = { "error", "warn" },
-- 	symbols = { error = " ", warn = " " },
-- 	colored = false,
-- 	update_in_insert = false,
-- 	always_visible = true,
-- }
--
-- local diff = {
-- 	"diff",
-- 	colored = false,
-- 	symbols = { added = " ", modified = " ", removed = " " }, -- changes diff symbols
--   cond = hide_in_width
-- }

-- local mode = {
-- 	"mode",
-- 	fmt = function(str)
-- 		return "-- " .. str .. " --"
-- 	end,
-- }
--
-- local filetype = {
-- 	"filetype",
-- 	icons_enabled = false,
-- 	icon = nil,
-- }
--
-- local branch = {
-- 	"branch",
-- 	icons_enabled = true,
-- 	icon = "",
-- }
--
-- local location = {
-- 	"location",
-- 	padding = 0,
-- }

-- cool function for progress
-- local progress = function()
-- 	local current_line = vim.fn.line(".")
-- 	local total_lines = vim.fn.line("$")
-- 	local chars = { "__", "▁▁", "▂▂", "▃▃", "▄▄", "▅▅", "▆▆", "▇▇", "██" }
-- 	local line_ratio = current_line / total_lines
-- 	local index = math.ceil(line_ratio * #chars)
-- 	return chars[index]
-- end

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
  local copilot_active = false

  -- add client
  for _, client in pairs(buf_clients) do
    if client.name ~= "null-ls" and client.name ~= "copilot" then
      table.insert(buf_client_names, client.name)
    end

    if client.name == "copilot" then
      copilot_active = true
    end
  end
  local unique_client_names = vim.fn.uniq(buf_client_names)
  local language_servers = "[" .. table.concat(unique_client_names, ", ") .. "]"
  if copilot_active then
    language_servers = language_servers .. "%#SLCopilot#"
  end
  return language_servers
end

local spaces = function()
	return "spaces: " .. vim.api.nvim_buf_get_option(0, "shiftwidth")
end

lualine.setup({
	options = {
		icons_enabled = true,
		theme = {
      normal = {
        c = { fg = "#908CA9", bg = "#0000ffff", gui = "bold" },
        a = { fg = "#DFDDF3", bg = "#286983", gui = "bold" },
        b = { fg = "#908CA9", bg = "#0000ffff", gui = "bold" },
        x = { fg = "#908CA9", bg = "#0000ffff", gui = "bold" },
        y = { fg = "#908CA9", bg = "#0000ffff", gui = "bold" },
        z = { fg = "#DFDDF3", bg = "#286983", gui = "bold" },
      },
      visual = {
        c = { fg = "#908CA9", bg = "#0000ffff", gui = "bold" },
        a = { fg = "#DFDDF3", bg = "#907AA8", gui = "bold" },
        b = { fg = "#908CA9", bg = "#0000ffff", gui = "bold" },
        x = { fg = "#908CA9", bg = "#0000ffff", gui = "bold" },
        y = { fg = "#908CA9", bg = "#0000ffff", gui = "bold" },
        z = { fg = "#DFDDF3", bg = "#907AA8", gui = "bold" },
      },
      insert = {
        c = { ft = "#908CA9", bg = "#0000ffff", gui = "bold" },
        a = { fg = "#DFDDF3", bg = "#B3637A", gui = "bold" },
        b = { fg = "#908CA9", bg = "#0000ffff", gui = "bold" },
        x = { fg = "#908CA9", bg = "#0000ffff", gui = "bold" },
        y = { fg = "#908CA9", bg = "#0000ffff", gui = "bold" },
        z = { fg = "#DFDDF3", bg = "#B3637A", gui = "bold" },
      },
      inactive = {
        c = { fg = "#908CA9", bg = "#0000ffff", gui = "bold" },
        a = { fg = "#DFDDF3", bg = "#6E6A86", gui = "bold" },
        b = { fg = "#908CA9", bg = "#0000ffff", gui = "bold" },
        x = { fg = "#908CA9", bg = "#0000ffff", gui = "bold" },
        y = { fg = "#908CA9", bg = "#0000ffff", gui = "bold" },
        z = { fg = "#DFDDF3", bg = "#6E6A86", gui = "bold" },
      },
      command = {
        c = { fg = "#908CA9", bg = "#0000ffff", gui = "bold" },
        a = { fg = "#DFDDF3", bg = "#6E6A86", gui = "bold" },
        b = { fg = "#908CA9", bg = "#0000ffff", gui = "bold" },
        x = { fg = "#908CA9", bg = "#0000ffff", gui = "bold" },
        y = { fg = "#908CA9", bg = "#0000ffff", gui = "bold" },
        z = { fg = "#DFDDF3", bg = "#6E6A86", gui = "bold" },
      },
      replace = {
        c = { fg = "#908CA9", bg = "#0000ffff", gui = "bold" },
        a = { fg = "#DFDDF3", bg = "#6E6A86", gui = "bold" },
        b = { fg = "#908CA9", bg = "#0000ffff", gui = "bold" },
        x = { fg = "#908CA9", bg = "#0000ffff", gui = "bold" },
        y = { fg = "#908CA9", bg = "#0000ffff", gui = "bold" },
        z = { fg = "#DFDDF3", bg = "#6E6A86", gui = "bold" },
      },
    },
		component_separators = { left = "", right = "" },
		section_separators = { left = "", right = "" },
		disabled_filetypes = { "alpha", "dashboard", "NvimTree", "Outline" },
		always_divide_middle = true,
	},
	sections = {
		lualine_a = { 'branch', 'diagnostics' },
		lualine_b = { 'mode', 'diff'},
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
