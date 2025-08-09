return {
  "neovim/nvim-lspconfig",
  opts = {
    servers = {
      gopls = {
        settings = {
          gopls = {
            formatting = false,
            gofumpt = false,
            hints = {
              assignVariableTypes = false,
              compositeLiteralFields = false,
              -- compositeLiteralTypes = false,
              -- constantValues = false,
              -- functionTypeParameters = false,
              parameterNames = false,
              rangeVariableTypes = false,
            },
          },
        },
      },
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
