local status_ok, lualine = pcall(require, "lualine")
if not status_ok then
	return
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
		disabled_filetypes = { "alpha", "dashboard" },
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
