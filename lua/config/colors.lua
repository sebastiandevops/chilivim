local status_ok, utils = pcall(require, "utils.set_theme")
if not status_ok then
  return
end

local colorscheme = "chili"

utils.set_theme(colorscheme)
