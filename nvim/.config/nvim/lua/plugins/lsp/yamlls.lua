return {
  capabilities = {
    textDocument = {
      foldingRange = {
        dynamicRegistration = false,
        lineFoldingOnly = true,
      },
    },
  },
  on_new_config = function(new_config)
    new_config.settings.yaml.schemas = require('schemastore').yaml.schemas()
  end,
  settings = {
    redhat = { telemetry = { enabled = false } },
    yaml = {
      keyOrdering = false,
      format = {
        enable = true,
      },
      validate = true,
      schemaStore = {
        enable = false,
        url = '',
      },
    },
  },
}
