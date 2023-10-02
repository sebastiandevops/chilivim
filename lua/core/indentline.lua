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
  enable = true,
  indent = {
    char = "┆",
    tab_char = "▎",
    highlight = { "IndentBlanklineChar" },
  },
  whitespace = {
    highlight = { "IndentBlanklineSpaceChar" },
  },
  scope = {
    enabled = true,
    char = "▎",
    show_end = false,
    highlight = { "IndentBlanklineContextChar" },
    include = {
      node_type = {
        ["*"] = {
          "argument",
          "expression",
          "for",
          "if",
          "import",
          "type",
          "arguments",
          -- "block",
          "bracket",
          "declaration",
          "field",
          "func_literal",
          "function",
          "import_spec_list",
          "list",
          "return_statement",
          "short_var_declaration",
          "statement",
          "switch_body",
          "try",
          "block_mapping_pair",
          "expression_list",
          "if_statement",
          "for_statement",
          "try_statement",
          "expression_statement",
          "except_clause",
          "while_statement",
          "with_statement",
          "class_declaration",
          "array",
          "redirected_statement",
          "object",
        },
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
    },
  },
}
