local status_ok, utils = pcall(require, "utils.set_theme")
if not status_ok then
  return
end

local colorscheme = "horizon"

utils.set_theme(colorscheme)

-- Custom configuration
-- vim.o.transparent = true
vim.cmd "let &fcs='eob: '"
vim.cmd "let g:gruvbox_material_transparent_background = 2"
vim.cmd "let g:gruvbox_material_enable_bold = 1"
