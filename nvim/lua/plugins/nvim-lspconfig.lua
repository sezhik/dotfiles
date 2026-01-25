return {
    "mason-org/mason-lspconfig.nvim",
    opts = {
        ensure_installed = { "lua_ls", "gopls", "tsserver", "vtls" },
        automatic_enable = false,
    },
    dependencies = {
        { "mason-org/mason.nvim", opts = {} },
        "neovim/nvim-lspconfig",
    },
    config = function()
        vim.diagnostic.config({
            float = {
                border = "rounded",
            },
            virtual_text = {
                prefix = '■',
                spacing = 4,
            },
            underline = true,
            update_in_insert = true,
            severity_sort = true,
        })

        vim.lsp.config("lua_ls", {
            filetypes = { "lua" },
            settings = {
                Lua = {
                    diagnostics = {
                        -- Это отключает предупреждение о "непонятной" переменной vim
                        globals = { "vim" },
                    },
                    workspace = {
                        -- Позволяет серверу знать о файлах Neovim
                        checkThirdParty = false,
                        library = {
                            vim.env.VIMRUNTIME,
                            -- Добавьте это, если хотите, чтобы LSP видел плагины
                            -- "${3rd}/luv/library"
                        },
                    },
                },
            },
        })

        vim.lsp.config("gopls", {
            filetypes = { "go" },
            cmd = { "gopls", "-remote=auto" },
            settings = {
                gopls = {
                    analyses = {
                        ST1000 = false,
                    },
                    gofumpt = true,
                    hints = {
                        assignVariableTypes = true,
                        compositeLiteralFields = true,
                        compositeLiteralTypes = true,
                        constantValues = true,
                        functionTypeParameters = true,
                        parameterNames = true,
                        rangeVariableTypes = true,
                    },
                },
            },
            on_attach = function(client, _)
                local module = vim.fn.trim(vim.fn.system("go list -m"))
                if module then
                    client.config.settings = vim.tbl_deep_extend("force", client.config.settings or {}, {
                        gopls = {
                            ["formatting.local"] = module,
                        },
                    })
                    -- Уведомляем сервер (обязательно!)
                    client.notify("workspace/didChangeConfiguration", {
                        settings = client.config.settings,
                    })
                end
            end,
        })

        -- local orig_util_open_floating_preview = vim.lsp.util.open_floating_preview
        -- function vim.lsp.util.open_floating_preview(contents, syntax, opts, ...)
        --     opts = opts or {}
        --     opts.border = opts.border or "rounded" -- Устанавливаем округлые границы
        --     return orig_util_open_floating_preview(contents, syntax, opts, ...)
        -- end

        vim.api.nvim_create_autocmd("LspAttach", {
            callback = function(args)
                local opts = { buffer = args.buf, nowait = true }

                vim.keymap.set("n", "K", vim.lsp.buf.hover, vim.tbl_extend("force", opts, { desc = "Show hint" }))

                vim.keymap.set(
                    "n",
                    "gd",
                    vim.lsp.buf.definition,
                    vim.tbl_extend("force", opts, { desc = "Go to definition" })
                )
                vim.keymap.set(
                    "n",
                    "gi",
                    Snacks.picker.lsp_implementations,
                    vim.tbl_extend("force", opts, { desc = "LSP implementations" })
                )

                vim.keymap.set(
                    "n",
                    "gr",
                    Snacks.picker.lsp_references,
                    vim.tbl_extend("force", opts, { desc = "LSP references" })
                )
                vim.keymap.set(
                    "n",
                    "<leader>ca",
                    vim.lsp.buf.code_action,
                    vim.tbl_extend("force", opts, { desc = "LSP code actions" })
                )

                vim.keymap.set(
                    "n",
                    "<leader>cr",
                    vim.lsp.buf.rename,
                    vim.tbl_extend("force", opts, { desc = "LSP Rename" })
                )
            end,
        })

        vim.lsp.enable({ "gopls", "lua_ls", "vtsls" })
    end,
}
