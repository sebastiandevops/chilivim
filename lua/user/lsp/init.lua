local status_ok, _ = pcall(require, "lspconfig")
if not status_ok then
  return
end

require "user.lsp.mason"
require("user.lsp.handlers").setup()
require "user.lsp.null-ls"
-- require'lspconfig'.jedi_language_server.setup{}
-- require'lspconfig'.lua_ls.setup{}
