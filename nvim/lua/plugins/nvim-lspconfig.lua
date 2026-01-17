return {
    "neovim/nvim-lspconfig",
    dependencies = {
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
    },
    config = function()
        require('mason').setup()
        require('mason-lspconfig').setup({
            ensure_installed = { "lua_ls", "gopls" }
        })

        vim.lsp.enable("lua_ls")
        vim.lsp.config("gopls", {
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
        vim.lsp.enable("gopls")

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
    end,
}
