return {
  python_env = {
    function()
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
  },

  lsp = {
    function(msg)
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
  },
  spaces = {
    function()
      return "spaces: " .. vim.api.nvim_buf_get_option(0, "shiftwidth")
    end
  },
}
