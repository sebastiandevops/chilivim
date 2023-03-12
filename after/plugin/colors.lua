local colorscheme = "gruvbox-material"

local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not status_ok then
  return
end

-- Custom configuration
-- vim.o.transparent = true
vim.cmd "let &fcs='eob: '"
vim.cmd "let g:gruvbox_material_transparent_background = 2"
vim.cmd "let g:gruvbox_material_enable_bold = 1"
