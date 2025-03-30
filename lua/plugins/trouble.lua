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
                '<cmd>Trouble lsp_definitions open_no_results=false warn_no_results=true<cr>',
                desc = 'LSP Definitions (Trouble)',
                nowait = true,
            },
            {
                'gD',
                '<cmd>Trouble lsp_declarations open_no_results=false warn_no_results=true<cr>',
                desc = 'LSP Declarations (Trouble)',
                nowait = true,
            },
            {
                'gi',
                '<cmd>Trouble lsp_implementations open_no_results=false warn_no_results=true<cr>',
                desc = 'LSP Implementations (Trouble)',
                nowait = true,
            },
            {
                'gr',
                '<cmd>Trouble lsp_references<cr> open_no_results=false warn_no_results=true',
                desc = 'LSP References (Trouble)',
                nowait = true,
            },
            {
                'gR',
                '<cmd>Trouble lsp_references filter=local open_no_results=false warn_no_results=true<cr>',
                desc = 'Local LSP References (Trouble)',
                nowait = true,
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
