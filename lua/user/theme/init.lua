-- After add your colorscheme to plugins filee, just change the variable theme
-- with the name of you colorscheme.
local theme = "gruvbox-material"

--- IF YOU WANT TO USE A CONFIGURATION FILE FOR YOU THEME, UNCOMMENT THE LINES BELOW.
-- Add your configuration file under colorschemes folder.

-- local theme_status_ok,  theme_call = pcall(require, theme)
-- if not theme_status_ok then
-- 	return
-- end
--
-- local config_status_ok, config_call = pcall(require, ("user.theme.colorschemes." .. theme))
-- if not config_status_ok then
--   return
-- else
--   theme_call.setup(config_call)
-- end

local colorscheme = theme
vim.o.transparent = true
vim.cmd "let &fcs='eob: '"

-- Custom configuration for colorschemes without its own config file under colorschemes folder
vim.cmd "let g:gruvbox_material_transparent_background = 2"
vim.cmd "let g:gruvbox_material_enable_bold = 1"
-- vim.g.minimal_transparent_background = true

local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not status_ok then
  return
end
