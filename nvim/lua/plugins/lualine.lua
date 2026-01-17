return {
    "nvim-lualine/lualine.nvim",
    dependencies = {
        { "yavorski/lualine-macro-recording.nvim" },
    },
    config = function()
        require("lualine").setup({
            options = {
                icons_enabled = true,
                globalstatus = true,
            },
            sections = {
                lualine_c = {
                    { "filename",        path = 1 },
                    { "macro_recording", "%S" },
                },
            },
        })
    end,
}
