local status_ok, indent_blankline = pcall(require, "ibl")
if not status_ok then
	return
end

vim.opt.list = true
vim.opt.listchars:append "space:⋅"
vim.opt.listchars:append "eol:¶"
vim.opt.listchars:append "tab:|⇢"
vim.opt.listchars:append "trail:·"
vim.opt.listchars:append "extends:>"
vim.opt.listchars:append "precedes:<"

indent_blankline.setup {
  indent = {
    char = "┆",
    tab_char = "▎",
    highlight = { "IndentBlanklineChar" },
  },
  whitespace = {
    highlight = { "IndentBlanklineChar" },
  },
  scope = {
    enabled = true,
    char = "▎",
    show_end = false,
    highlight = { "IndentBlanklineContextChar" },
    include = {
      node_type = {
        ["*"] = { "*" },
      },
    },
  },
  exclude = {
    filetypes = {
      "help",
      "packer",
      "NvimTree",
      "conf",
      "alpha",
      "FTerm",
      "yaml",
    },
  },
}
