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
}
