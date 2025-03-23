return {
    {
        'neovim/nvim-lspconfig',
        dependencies = { 'saghen/blink.cmp' },

        -- example using `opts` for defining servers
        opts = {
            servers = {
                lua_ls = {},
                fsautocomplete = {},
                biome = {},
                ts_ls = {},
                koka = {},
            },
        },
        config = function(_, opts)
            local lspconfig = require 'lspconfig'
            for server, config in pairs(opts.servers) do
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
