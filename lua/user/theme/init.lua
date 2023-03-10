local utils = require("user.theme.utils")

local colorscheme = "catppuccin"

-- Some colorschemes have a strange behavior when loading configuration file.
-- Most times, utility set_theme will load the configuration.
-- if not just uncomment the require line. Make sure you have the config
-- file under colorschemes folder.

-- require(colorscheme).setup(require("user.theme.colorschemes." .. colorscheme))

utils.set_theme(colorscheme)

-- Custom configuration
vim.o.transparent = true
vim.cmd "let &fcs='eob: '"
-- vim.cmd "let g:gruvbox_material_transparent_background = 2"
-- vim.cmd "let g:gruvbox_material_enable_bold = 1"
