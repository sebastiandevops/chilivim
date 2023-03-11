local status_ok, mason_null_ls = pcall(require, "mason-null-ls")
if not status_ok then
  return
end

local linters = {
  "pydocstyle",
  "pyproject-flake8",
}

local formatters = {
  "autopep8",
  "yamlfmt",
  "jq",
}

require("mason").setup()
mason_null_ls.setup {
  ensure_installed = linters, formatters, -- Opt to list sources here, when available in mason.
  automatic_installation = { exclude = { "flake8", "black"} },
  automatic_setup = true, -- Recommended, but optional
}

require 'mason-null-ls'.setup_handlers() -- If `automatic_setup` is true.
