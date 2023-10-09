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
      schemaStore = {
        -- You must disable built-in schemaStore support if you want to use
        -- this plugin and its advanced options like `ignore`.
        enable = false,
        -- Avoid TypeError: Cannot read properties of undefined (reading 'length')
        url = "",
      },
      schemas = schemastore.yaml.schemas(),
      -- validate = { enable = true },
      customTags = {
        "!Ref",
        "!ImportValue",
        "!GetAtt"
      },
    }
  },
}

return opts
