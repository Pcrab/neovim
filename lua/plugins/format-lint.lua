return {
    {
        'stevearc/conform.nvim',
        opts = {
            formatters_by_ft = {
                lua = { 'stylua' },
            },
            default_format_opts = {
                lsp_format = 'fallback',
            },
            format_on_save = {
                -- These options will be passed to conform.format()
                timeout_ms = 500,
                lsp_format = 'fallback',
            },
        },
    },
}
