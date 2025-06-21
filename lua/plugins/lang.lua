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
    {
        'elixir-tools/elixir-tools.nvim',
        version = '*',
        event = { 'BufReadPre', 'BufNewFile' },
        config = function()
            local elixir = require 'elixir'
            local elixirls = require 'elixir.elixirls'

            elixir.setup {
                nextls = { enable = true },
                elixirls = {
                    enable = true,
                    settings = elixirls.settings {
                        enableTestLenses = true,
                    },
                    on_attach = function(client, bufnr)
                        vim.keymap.set('n', '<space>fp', ':ElixirFromPipe<cr>', { buffer = true, noremap = true })
                        vim.keymap.set('n', '<space>tp', ':ElixirToPipe<cr>', { buffer = true, noremap = true })
                        vim.keymap.set('v', '<space>em', ':ElixirExpandMacro<cr>', { buffer = true, noremap = true })
                    end,
                },
                projectionist = {
                    enable = true,
                },
            }
        end,
        dependencies = {
            'nvim-lua/plenary.nvim',
        },
    },
}
