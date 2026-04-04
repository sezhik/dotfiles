return {
    "stevearc/oil.nvim",
    ---@module 'oil'
    ---@type oil.SetupOpts
    opts = {
        watch_for_changes = true,
        skip_confirm_for_simple_edits = true,
        delete_to_trash = true,
        view_options = {
            show_hidden = true,
        },
        win_options = {
            wrap = true,
        },
        keymaps = {
            ["<C-h>"] = false,
            ["<C-j>"] = false,
            ["<C-k>"] = false,
            ["<C-l>"] = false,
        },
    },
    -- Optional dependencies
    dependencies = { { "nvim-mini/mini.icons", opts = {} } },
    -- Lazy loading is not recommended because it is very tricky to make it work correctly in all situations.
    lazy = false,
}
