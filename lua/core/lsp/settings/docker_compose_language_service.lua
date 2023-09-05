local nvim_lsp = require'nvim_lsp'

return {
  settings = {
    languageserver = {
      docker_compose_language_service = {
        args = "--stdio",
        command = "docker-compose-langserver",
        filetypes = { "docker-compose.yaml" },
        root_dir = nvim_lsp.util.root_pattern('docker-compose.yaml'),
      },
    },
  },
}
