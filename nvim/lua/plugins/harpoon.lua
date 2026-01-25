return {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    dependencies = { "nvim-lua/plenary.nvim", "folke/snacks.nvim" },
    config = function()
        local harpoon = require("harpoon")

        -- REQUIRED
        harpoon:setup()
        -- REQUIRED

        vim.keymap.set("n", "<leader>ha", function() harpoon:list():add() end, { desc = "Harpoon add" })
        vim.keymap.set("n", "<leader>hr", function() harpoon:list():remove() end, { desc = "Harpoon remove" })
        vim.keymap.set("n", "<leader>hc", function() harpoon:list():clear() end, { desc = "Harpoon clear" })

        local function harpoon_picker()
            local files = harpoon:list().items
            local paths = {}

            -- Извлекаем пути из объектов Harpoon
            for _, item in ipairs(files) do
                table.insert(paths, item.value)
            end

            -- Запускаем Snacks Picker со списком файлов
            require("snacks").picker.files({
                title = "Harpoon",
                -- Передаем список путей напрямую
                finder = function()
                    local items = {}
                    for i, path in ipairs(paths) do
                        table.insert(items, {
                            text = path,
                            file = path,
                            idx = i,
                        })
                    end
                    return items
                end,
                -- Форматирование отображения
                format = "file",
            })
        end

        -- Привязываем к клавише (например, <leader>sh)
        vim.keymap.set("n", "<leader>e", harpoon_picker, { desc = "Snacks Picker: Harpoon" })
    end,
}
