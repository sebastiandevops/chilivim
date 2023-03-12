local utils = require "user.utils.utils"

local colorscheme = "kanagawa"

utils.set_theme(colorscheme)

-- Custom configuration
-- vim.o.transparent = true
vim.cmd "let &fcs='eob: '"
vim.cmd "let g:gruvbox_material_transparent_background = 2"
vim.cmd "let g:gruvbox_material_enable_bold = 1"
