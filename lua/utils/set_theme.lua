local M = {}

function M.set_theme(theme)
  local file_exists = vim.fn.empty(vim.fn.glob("~/.config/nvim/lua/core/colorschemes/" .. theme .. ".lua")) == 0

  if file_exists then
    -- Load the theme file
    local theme_call = require(theme)
    local config_status_ok, config_call = pcall(require, ("core.colorschemes." .. theme))
    if config_status_ok and type(config_call) == "table" then
      theme_call.setup(config_call)
      local status_ok, _ = pcall(vim.cmd, "colorscheme " .. theme)
      if not status_ok then
        return
      end
    else
      return
    end
  else
    local status_ok, _ = pcall(vim.cmd, "colorscheme " .. theme)
    if not status_ok then
      return
    end
  end
end

return M
