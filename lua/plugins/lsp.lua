return {
    {
        'neovim/nvim-lspconfig',
        dependencies = { 'saghen/blink.cmp', 'b0o/schemastore.nvim' },
        config = function()
            local servers = {
                lua_ls = {},
                fsautocomplete = {},
                ts_ls = {},
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
                config.on_attach = function(args)
                    vim.lsp.codelens.clear()
                    vim.lsp.codelens.refresh()
                    if vim.lsp.buf.inlay_hint then
                        vim.lsp.buf.inlay_hint(args.buf, true)
                    elseif vim.lsp.inlay_hint then
                        vim.lsp.inlay_hint.enable(true)
                    end
                end
                lspconfig[server].setup(config)
            end
        end,
    },
}
