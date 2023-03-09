-- After add your colorscheme to plugins filee, just change the variable theme
-- with the name of you colorscheme.
-- If you don't want to use the color default configuration you can add your
-- under colorschemes folder.
local theme = "kanagawa"

local theme_status_ok,  theme_call = pcall(require, theme)
if not theme_status_ok then
	return
end

local config_status_ok, config_call = pcall(require, ("user.theme.colorschemes." .. theme))
if not config_status_ok then
  theme_call.setup()
else
  theme_call.setup(config_call)
end


local colorscheme = theme
vim.o.transparent = true
vim.cmd "let &fcs='eob: '"
local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not status_ok then
  return
end
