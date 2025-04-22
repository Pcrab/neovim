vim.filetype.add {
    extension = {
        kk = 'koka',
    },
}

return {
    {
        'koka-lang/koka',
        config = function(plugin)
            vim.opt.rtp:append(plugin.dir .. '/support/vim')
        end,
    },
    'b0o/schemastore.nvim',
    {
        'mrcjkb/haskell-tools.nvim',
        version = '^5',
        lazy = false,
    },
    {
        'mrcjkb/rustaceanvim',
        version = '^6', -- Recommended
        lazy = false, -- This plugin is already lazy
    },
}
