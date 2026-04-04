return {
    "MagicDuck/grug-far.nvim",
    -- Note (lazy loading): grug-far.lua defers all it's requires so it's lazy by default
    -- additional lazy config to defer loading is not really needed...
    config = function()
        local far = require("grug-far")
        far.setup({})
        vim.keymap.set({ 'n', 'x' }, '<leader>sr', function()
            far.open({ prefills = { search = vim.fn.expand("<cword>") } })
        end, { desc = 'Search and replace' })
    end,
}
