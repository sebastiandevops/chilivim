local status_ok, indent_blankline = pcall(require, "indent_blankline")
if not status_ok then
	return
end

vim.opt.list = true
vim.opt.listchars:append "space:⋅"
vim.opt.listchars:append "eol:¶"
vim.opt.listchars:append "tab:» "
vim.opt.listchars:append "trail:·"
vim.opt.listchars:append "extends:>"
vim.opt.listchars:append "precedes:<"

indent_blankline.setup {
  -- space_char_blankline = " ",
  context_char = "▎",
  -- char = "",
  show_trailing_blankline_indent = true,
  show_first_indent_level = true,
  use_treesitter = true,
  use_treesitter_scope = true,
  show_current_context = true,
  show_current_context_start = true,
  buftype_exclude = { "terminal", "nofile", "toggleterm", "alpha" },
  filetype_exclude = {
    "help",
    "packer",
    "NvimTree",
    "conf",
    "alpha",
    "toggleterm",
  },
}
