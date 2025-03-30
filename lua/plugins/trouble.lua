return {
    {
        'folke/trouble.nvim',
        opts = {
            open_no_results = true,
            warn_no_results = false,
            focus = true,
            win = {
                wo = {
                    wrap = true,
                },
            },
        },
        cmd = 'Trouble',
        keys = {
            {
                'gd',
                '<cmd>Trouble lsp_definitions<cr>',
                desc = 'LSP Definitions (Trouble)',
            },
            {
                'gD',
                '<cmd>Trouble lsp_declarations<cr>',
                desc = 'LSP Declarations (Trouble)',
            },
            {
                'gi',
                '<cmd>Trouble lsp_implementations<cr>',
                desc = 'LSP Implementations (Trouble)',
            },
            {
                'gr',
                '<cmd>Trouble lsp_references<cr>',
                desc = 'LSP References (Trouble)',
            },
            {
                'gR',
                '<cmd>Trouble lsp_references filter=local<cr>',
                desc = 'Local LSP References (Trouble)',
            },
            {
                '<leader>q',
                '<cmd>Trouble toggle<cr>',
                desc = 'Diagnostics (Trouble)',
            },
            {
                '<leader>xx',
                '<cmd>Trouble diagnostics toggle<cr>',
                desc = 'Diagnostics (Trouble)',
            },
            {
                '<leader>xX',
                '<cmd>Trouble diagnostics toggle filter.buf=0<cr>',
                desc = 'Buffer Diagnostics (Trouble)',
            },
            {
                '<leader>cs',
                '<cmd>Trouble symbols toggle focus=false<cr>',
                desc = 'Symbols (Trouble)',
            },
            -- {
            --     '<leader>xQ',
            --     '<cmd>Trouble qflist toggle<cr>',
            --     desc = 'Quickfix List (Trouble)',
            -- },
        },
    },
}
