return {
    {
        'akinsho/toggleterm.nvim',
        version = '*',
        config = function()
            require('toggleterm').setup {}

            local Terminal = require('toggleterm.terminal').Terminal
            local floatTerm = Terminal:new { direction = 'float' }
            local term = Terminal:new {}

            vim.keymap.set({ 'n', 't' }, '<C-\\>', function()
                floatTerm:toggle()
            end, { noremap = true, silent = true })
            vim.keymap.set({ 'n', 't' }, '<A-\\>', function()
                term:toggle()
            end, { noremap = true, silent = true })

            vim.keymap.set('t', '<ESC>', [[<C-\><C-n>]], { noremap = true, silent = true })
        end,
    },
}
