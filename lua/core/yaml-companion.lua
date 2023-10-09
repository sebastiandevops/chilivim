local yaml_companion_status_ok, yaml_companion = pcall(require, 'yaml-companion')
if not yaml_companion_status_ok then
  return
end

local cfg = require("yaml-companion").setup({
  -- Add any options here, or leave empty to use the default settings
  -- lspconfig = {
  --   cmd = {"yaml-language-server"}
  -- },
})
require("lspconfig")["yamlls"].setup(cfg)
