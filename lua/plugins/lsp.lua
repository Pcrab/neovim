return {
    "williamboman/mason-lspconfig.nvim",
    dependencies = {
        "williamboman/mason.nvim",
        "neovim/nvim-lspconfig",
        "b0o/SchemaStore.nvim",
        "VidocqH/lsp-lens.nvim",
    },
    config = function()
        local lspconfig = require("lspconfig")

        local capabilities = require("core.capabilities")

        require("mason").setup()
        require("mason-lspconfig").setup({
            ensure_installed = {
                "clangd",
                "clojure_lsp",
                "lua_ls",
                "jsonls",
                "yamlls",
                "nim_langserver",
            },
        })

        -- Config lsps
        lspconfig.clangd.setup({
            capabilities = capabilities,
        })

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
        lspconfig.nim_langserver.setup({
            capabilities = capabilities,
        })
        lspconfig.clojure_lsp.setup({
            capabilities = capabilities,
        })
        lspconfig.zls.setup({
            capabilities = capabilities,
        })
        lspconfig.kotlin_language_server.setup({
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

        require("lsp-lens").setup({})
    end,
}
