return {
    {
        "stevearc/dressing.nvim",
        event = "VeryLazy",
        config = function()
            require("dressing").setup({
                input = { win_options = { winblend = 0 } },
                select = {
                    get_config = function(opts)
                        if opts.kind == "codeaction" then
                            return {
                                backend = "builtin",
                                builtin = { relative = "cursor", max_width = 80 },
                            }
                        end
                    end,
                },
            })
        end,
    },
    -- improve vim quickfix UI
    { "kevinhwang91/nvim-bqf", ft = "qf" },
    {
        "lewis6991/gitsigns.nvim",
        opts = {
            signs = {
                add = { text = "│" },
                change = { text = "│" },
                delete = { text = "_" },
                topdelete = { text = "‾" },
                changedelete = { text = "~" },
                untracked = { text = "┆" },
            },
            signcolumn = true, -- Toggle with `:Gitsigns toggle_signs`
            numhl = true, -- Toggle with `:Gitsigns toggle_numhl`
            linehl = false, -- Toggle with `:Gitsigns toggle_linehl`
            word_diff = false, -- Toggle with `:Gitsigns toggle_word_diff`
            watch_gitdir = {
                follow_files = true,
            },
            attach_to_untracked = true,
            current_line_blame = true, -- Toggle with `:Gitsigns toggle_current_line_blame`
            current_line_blame_opts = {
                virt_text = true,
                virt_text_pos = "eol", -- "eol" | "overlay" | "right_align"
                delay = 0,
                ignore_whitespace = false,
            },
            current_line_blame_formatter = "<author>, <author_time:%Y-%m-%d> - <summary>",
            sign_priority = 6,
            update_debounce = 100,
            status_formatter = nil, -- Use default
            max_file_length = 40000, -- Disable if file is longer than this (in lines)
            preview_config = {
                -- Options passed to nvim_open_win
                border = "single",
                style = "minimal",
                relative = "cursor",
                row = 0,
                col = 1,
            },
            yadm = {
                enable = false,
            },
        },
    },
    {
        "kevinhwang91/nvim-hlslens",
        lazy = false,
        keys = {
            {
                "n",
                mode = { "n" },
                [[<Cmd>execute('normal! ' . v:count1 . 'n')<CR><Cmd>lua require('hlslens').start()<CR>]],
            },
            {
                "N",
                mode = { "n" },
                [[<Cmd>execute('normal! ' . v:count1 . 'N')<CR><Cmd>lua require('hlslens').start()<CR>]],
            },
            {
                "*",
                mode = { "n" },
                [[*<Cmd>lua require('hlslens').start()<CR>]],
            },
            {
                "#",
                mode = { "n" },
                [[#<Cmd>lua require('hlslens').start()<CR>]],
            },
            {
                "g*",
                mode = { "n" },
                [[g*<Cmd>lua require('hlslens').start()<CR>]],
            },
            {
                "g#",
                mode = { "n" },
                [[g#<Cmd>lua require('hlslens').start()<CR>]],
            },
            {
                "<BS>",
                mode = { "n" },
                "<Cmd>noh<CR>",
            },
        },
        opts = {},
    },
    {
        "rcarriga/nvim-notify",
        event = "VeryLazy",
        dependencies = { "j-hui/fidget.nvim" },
        config = function()
            require("notify").notify = require("fidget").notify
        end,
    },
}
