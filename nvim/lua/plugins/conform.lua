return {
    "stevearc/conform.nvim",
    opts = {
        formatters = {
            sqruff = {
                command = "sqruff",
                args = { "fix", "--dialect", "postgres", "--format", "human" },
                stdin = false,
            }
        },
        formatters_by_ft = {
            lua = { "stylua" },
            sql = { "sqruff" },
            json = { "biome" },
        },
        format_on_save = {
            -- These options will be passed to conform.format()
            timeout_ms = 1000,
            lsp_format = "fallback",
        },
    },
}
