return {
    {
        'neovim/nvim-lspconfig',
        dependencies = { 'saghen/blink.cmp', 'b0o/schemastore.nvim' },
        config = function()
            local servers = {
                lua_ls = {},
                fsautocomplete = {},
                vtsls = {
                    settings = {
                        vtsls = {
                            autoUseWorkspaceTsdk = true,
                        },
                        javascript = {
                            implementationsCodeLens = {
                                enabled = true,
                            },
                            referencesCodeLens = {
                                enabled = true,
                                showOnAllFunctions = true,
                            },
                            inlayHints = {
                                parameterNames = {
                                    enabled = true,
                                },
                                parameterTypes = {
                                    enabled = true,
                                },
                                variableTypes = {
                                    enabled = true,
                                },
                                propertyDeclarationTypes = {
                                    enabled = true,
                                },
                                functionLikeReturnTypes = {
                                    enabled = true,
                                },
                                enumMemberValues = {
                                    enabled = true,
                                },
                            },
                        },
                        typescript = {
                            implementationsCodeLens = {
                                enabled = true,
                            },
                            referencesCodeLens = {
                                enabled = true,
                                showOnAllFunctions = true,
                            },
                            inlayHints = {
                                parameterNames = {
                                    enabled = true,
                                },
                                parameterTypes = {
                                    enabled = true,
                                },
                                variableTypes = {
                                    enabled = true,
                                },
                                propertyDeclarationTypes = {
                                    enabled = true,
                                },
                                functionLikeReturnTypes = {
                                    enabled = true,
                                },
                                enumMemberValues = {
                                    enabled = true,
                                },
                            },
                        },
                    },
                },
                koka = {},
                metals = {},
                jsonls = {
                    settings = {
                        json = {
                            schemas = require('schemastore').json.schemas(),
                            validate = { enable = true },
                        },
                    },
                },
                biome = {},
            }
            local lspconfig = require 'lspconfig'
            for server, config in pairs(servers) do
                config.capabilities = require('blink.cmp').get_lsp_capabilities(config.capabilities)
                config.on_attach = function()
                    vim.lsp.codelens.clear()
                    vim.lsp.codelens.refresh()
                    vim.lsp.inlay_hint.enable(true)
                end
                lspconfig[server].setup(config)
            end
        end,
    },
}
