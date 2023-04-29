return {
  settings = {
    languageserver = {
      quick_lint_js = {
        args = "--lsp-server",
        command = "quick-lint-js",
        filetypes = { "javascript", "javascriptreact", "json" }
      },
    },
  },
}
