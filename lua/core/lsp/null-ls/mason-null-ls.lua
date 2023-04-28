local status_ok, mason_null_ls = pcall(require, "mason-null-ls")
if not status_ok then
  return
end

local linters = {
  "flake8",
  "quick-lint-js",
}

local formatters = {
  "black",
  "yamlfmt",
  "jq",
}

require("mason").setup()
mason_null_ls.setup {
  ensure_installed = linters, formatters, -- Opt to list sources here, when available in mason.
  automatic_installation = { exclude = { "pyproject-flake8", "pydocstyle" } },
  automatic_setup = true, -- Recommended, but optional
}
