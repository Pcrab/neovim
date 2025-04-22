return {
    {
        'windwp/nvim-autopairs',
        config = function()
            require('nvim-autopairs').setup {}
            require('nvim-autopairs').get_rules("'")[1].not_filetypes = { 'scheme', 'lisp' }
        end,
    },
}
