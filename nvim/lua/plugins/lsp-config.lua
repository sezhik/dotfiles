return {
  "neovim/nvim-lspconfig",
  opts = {
    servers = {
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
