return {
    {
        'nvim-telescope/telescope.nvim',
        dependencies = { 'nvim-lua/plenary.nvim' },
        keys = {
            { '<leader>ff', '<CMD>Telescope find_files<CR>', mode = 'n', desc = 'Find File' },
            { '<leader>fg', '<CMD>Telescope live_grep<CR>', mode = 'n', desc = 'Live Grep' },
        },
    },
}
