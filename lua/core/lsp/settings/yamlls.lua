local schema_store_status_ok, schemastore = pcall(require, "schemastore")
if not schema_store_status_ok then
  return
end

local extend_schemas = {
  ["https://raw.githubusercontent.com/yannh/kubernetes-json-schema/master/v1.26.2/all.json"] = "k8s/**",
  ["https://raw.githubusercontent.com/quantumblacklabs/kedro/develop/static/jsonschema/kedro-catalog-0.17.json"]= "conf/**/*catalog*",
  ["https://json.schemastore.org/github-workflow.json"] = "/.github/workflows/*"
}

local opts = {
  settings = {
    yaml = {
      schemas = vim.list_extend(
        {
          extend_schemas,
        },
        schemastore.yaml.schemas()
      ),
      validate = { enable = true },
    }
  },
}

return opts
