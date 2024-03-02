local status_ok, mason_null_ls = pcall(require, "mason-null-ls")
if not status_ok then
  return
end

local linters = {
  "pylint",
  "quick-lint-js",
  "vale",
}

local formatters = {
  "black",
  "yamlfmt",
  "jq",
}

require("mason").setup()
mason_null_ls.setup {
  ensure_installed = linters, formatters, -- Opt to list sources here, when available in mason.
  automatic_installation = { exclude = { "pylint" } },
  automatic_setup = true, -- Recommended, but optional
}
