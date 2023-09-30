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
  space_char_blankline = " ",
  indent = {
    char = "┆",
    tab_char = "▎",
    highlight = { "IndentBlanklineChar" },
  },
  whitespace = {
    enable = true,
    remove_blankline_trail = true,
    highlight = { "IndentBlanklineSpaceChar" },
  },
  scope = {
    enabled = true,
    char = "▎",
    show_start = true,
    show_end = false,
    injected_languages = true,
    highlight = { "IndentBlanklineContextChar" },
    priority = 1024,
    include = {
      node_type = {
        ["*"] = {
          "^argument",
          "^expression",
          "^for",
          "^if",
          "^import",
          "^type",
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
  -- char = "",
  -- show_trailing_blankline_indent = true,
  -- show_first_indent_level = true,
  -- use_treesitter = true,
  -- use_treesitter_scope = true,
  -- show_current_context = true,
  -- show_current_context_start = true,
  -- show_end_of_line = true,
  buftype_exclude = { "terminal", "nofile", "FTerm", "alpha" },
  exclude = {
    "help",
    "packer",
    "NvimTree",
    "conf",
    "alpha",
    "FTerm",
  },
}
