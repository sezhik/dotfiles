return {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,
    ---@type snacks.Config
    opts = {
        statuscolumn = { enabled = true },
        bigfile = { enabled = true },
        indent = { enabled = true },
        scroll = { enabled = true },
        picker = {
            enabled = true,
            sources = {
                files = { hidden = true, ignored = false },
            },
        },
        input = { enabled = true },
        select = { enabled = true },
        notifier = { enabled = true },
        git = { enabled = true },
    },
    keys = {
        {
            "<leader><space>",
            function()
                Snacks.picker.smart()
            end,
            desc = "Smart Find Files",
        },
        {
            "<leader>sg",
            function()
                Snacks.picker.grep()
            end,
            desc = "Grep",
        },
        {
            "<leader>sb",
            function()
                Snacks.picker.lines()
            end,
            desc = "Grep buffer line",
        },
        {
            "<leader>ss",
            function()
                Snacks.picker.lsp_workspace_symbols()
            end,
            desc = "LSP Workspace Symbols",
        },
        {
            "<leader>sd",
            function()
                Snacks.picker.diagnostics()
            end,
            desc = "Diagnostics",
        },
        {
            "<leader>sn",
            function()
                Snacks.notifier.show_history()
            end,
            desc = "Diagnostics",
        },
        {
            "<leader>st",
            function()
                Snacks.picker.todo_comments()
            end,
            desc = "TODO",
        },
    },
}
