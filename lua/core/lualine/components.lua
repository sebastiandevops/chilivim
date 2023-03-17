local M = {}

local utils_status_ok, utils = pcall(require, "core.lualine.utils")
if not utils_status_ok then
  return
end

local formatters_status_ok, formatters = pcall(require, "core.lsp.null-ls.formatters")
if not formatters_status_ok then
  return
end

local linters_status_ok, linters = pcall(require ,"core.lsp.null-ls.linters")
if not linters_status_ok then
  return
end

M = {
  python_env = {
    function()
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
  },

  diff = {
    'diff',
    colored = true,
    diff_color = {
      -- Same color values as the general color option can be used here.
      added    = 'DiffAdd',    -- Changes the diff's added color
      modified = 'DiffChange', -- Changes the diff's modified color
      removed  = 'DiffDelete', -- Changes the diff's removed color you
    },
    symbols = {added = '+', modified = '~', removed = '-'}, -- Changes the symbols used by the diff.
    source = nil, -- A function that works as a data source for diff.
    -- It must return a table as such:
    --   { added = add_count, modified = modified_count, removed = removed_count }
    -- or nil on failure. count <= 0 won't be displayed.
  },

  fileformat = {
    'fileformat',
    symbols = {
      unix = '🐧', -- e712
      dos = '',  -- e70f
      mac = 'LF',  -- e711
    }
  },

  lsp = {
    function(msg)
      msg = msg or "LS Inactive"
      local buf_clients = vim.lsp.buf_get_clients()
      if next(buf_clients) == nil then
        -- TODO: clean up this if statement
        if type(msg) == "boolean" or #msg == 0 then
          return "LS Inactive"
        end
        return msg
      end
      local buf_ft = vim.bo.filetype
      local buf_client_names = {}

      -- add client
      for _, client in pairs(buf_clients) do
        if client.name ~= "null-ls" and client.name ~= "copilot" then
          table.insert(buf_client_names, client.name)
        end

      end
      -- add formatter
      local supported_formatters = formatters.list_registered(buf_ft)
      vim.list_extend(buf_client_names, supported_formatters)

      -- add linter
      local supported_linters = linters.list_registered(buf_ft)
      vim.list_extend(buf_client_names, supported_linters)

      local unique_client_names = vim.fn.uniq(buf_client_names)
      local language_servers = "[" .. table.concat(unique_client_names, ", ") .. "]"
      return language_servers
    end
  },
  spaces = {
    function()
      return "spaces: " .. vim.api.nvim_buf_get_option(0, "shiftwidth")
    end
  },
}

return M
