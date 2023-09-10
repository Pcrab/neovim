return {
    "williamboman/mason-lspconfig.nvim",
    dependencies = {
        "williamboman/mason.nvim",
        "neovim/nvim-lspconfig",
        "b0o/SchemaStore.nvim",
    },
    config = function()
        local lspconfig = require("lspconfig")

        local capabilities = require("core.capabilities")

        require("mason").setup()
        require("mason-lspconfig").setup({
            ensure_installed = { "lua_ls", "jsonls", "yamlls", "unocss" },
        })

        -- Config lsps
        lspconfig.unocss.setup({
            capabilities = capabilities,
        })
        lspconfig.jsonls.setup({
            settings = {
                json = {
                    schemas = require("schemastore").json.schemas(),
                    validate = { enable = true },
                },
            },
            on_attach = function(client, bufnr)
                client.server_capabilities.documentFormattingProvider = false
            end,
            capabilities = capabilities,
        })

        lspconfig.yamlls.setup({
            capabilities = capabilities,
            settings = {
                yaml = {
                    keyOrdering = false,
                    schemaStore = {
                        enable = false,
                        url = "",
                    },
                    schemas = require("schemastore").yaml.schemas(),
                },
            },
        })
        lspconfig.lua_ls.setup({
            on_attach = function(client, bufnr)
                client.server_capabilities.documentFormattingProvider = false
            end,
            capabilities = capabilities,
            settings = {
                Lua = {
                    hint = {
                        enable = true,
                        setType = true,
                    },
                    codelens = {
                        enable = true,
                    },
                    completion = {
                        callSnippet = "Replace",
                        postfix = ".",
                        showWord = "Disable",
                        workspaceWord = false,
                    },
                },
            },
        })
    end,
}
