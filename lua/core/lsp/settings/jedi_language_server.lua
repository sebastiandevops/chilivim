local nvim_lsp = require'nvim_lsp'

return {
  default_config = {
    cmd = { "jedi-language-server" },
    filetype = { "python" },
    root_dir = nvim_lsp.util.root_pattern('*.py', '.git', 'setup.py', 'pyproject.toml'),
    single_file_support = true,
  },
}
