return {
    -- indent hint
    {
        "lukas-reineke/indent-blankline.nvim",
        dependencies = { "nvim-treesitter/nvim-treesitter" },
        event = { "BufReadPre", "BufNewFile" },
        main = "ibl",
        opts = {
            indent = { char = "¦" },
            exclude = {
                buftypes = { "help", "nofile", "nowrite", "quickfix", "terminal", "prompt" },
            },
            scope = { enabled = false },
        },
    },
    -- highlight color value
    { "norcalli/nvim-colorizer.lua", cmd = "ColorizerToggle" },
    {
        "folke/flash.nvim",
        event = "VeryLazy",
        opts = {},
        keys = {
            {
                "s",
                mode = { "n", "x", "o" },
                function()
                    require("flash").jump()
                end,
                desc = "Flash",
            },
            {
                "S",
                mode = { "n", "x", "o" },
                function()
                    require("flash").treesitter()
                end,
                desc = "Flash Treesitter",
            },
            {
                "r",
                mode = "o",
                function()
                    require("flash").remote()
                end,
                desc = "Remote Flash",
            },
            {
                "R",
                mode = { "o", "x" },
                function()
                    require("flash").treesitter_search()
                end,
                desc = "Treesitter Search",
            },
            {
                "<c-s>",
                mode = { "c" },
                function()
                    require("flash").toggle()
                end,
                desc = "Toggle Flash Search",
            },
        },
    },
    {
        "chrisgrieser/nvim-spider",
        keys = {
            {
                "e",
                [[<cmd>lua require("spider").motion("e")<CR>]],
                mode = { "n", "o", "x" },
            },
            {
                "w",
                [[<cmd>lua require("spider").motion("w")<CR>]],
                mode = { "n", "o", "x" },
            },
        },
    },
}
