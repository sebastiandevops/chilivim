local status_ok, indent_blankline = pcall(require, "indent_blankline")
if not status_ok then
	return
end

vim.opt.list = true

indent_blankline.setup {
  -- space_char_blankline = " ",
  char = "▎",
  -- show_trailing_blankline_indent = false,
  -- show_first_indent_level = true,
  -- use_treesitter = true,
  use_treesitter = true,
  use_treesitter_scope = true,
  show_current_context = true,
  show_current_context_start = true,
  buftype_exclude = { "terminal", "nofile", "toggleterm" },
  filetype_exclude = {
    "help",
    "packer",
    "NvimTree",
    "conf",
    "alpha",
    "toggleterm",
  },
}
