return {
  "neovim/nvim-lspconfig",
  opts = {
    servers = {

      gopls = {
        cmd = { "gopls", "-remote=auto" },
        settings = {
          gopls = {
            analyses = {
              ST1000 = false,
            },
            gofumpt = true,
            hints = {
              assignVariableTypes = false,
              compositeLiteralFields = false,
              compositeLiteralTypes = false,
              -- constantValues = false,
              -- functionTypeParameters = false,
              parameterNames = false,
              rangeVariableTypes = false,
            },
          },
        },
      },

      -- YAML
      yamlls = {
        settings = {
          yaml = {
            format = {
              enable = false, -- Ensure formatting is enabled
              singleQuote = false, -- Set to true to prefer single quotes
            },
            -- Other yamlls settings can be configured here
          },
        },
      },
    },
  },
}
