return {
    {
        "folke/which-key.nvim",
        event = "VeryLazy",
        init = function()
            vim.o.timeout = true
            vim.o.timeoutlen = 300
        end,
        config = function()
            require("which-key").setup({})
        end,
    },
    {
        "folke/neoconf.nvim",
        priority = 0,
        lazy = false,
        opts = {},
    },
    { "wakatime/vim-wakatime" },
    {
        "folke/persistence.nvim",
        opts = {},
        event = "BufReadPre",
        keys = {
            {
                "<leader>s",
                mode = "n",
                function()
                    require("persistence").load()
                end,
                desc = "Load session",
            },
        },
    },
    {
        "nvimdev/dashboard-nvim",
        event = "VimEnter",
        config = function()
            require("dashboard").setup({
                -- config
            })
        end,
        dependencies = { { "nvim-tree/nvim-web-devicons" } },
    },
    {
        "m4xshen/hardtime.nvim",
        dependencies = { "MunifTanjim/nui.nvim", "nvim-lua/plenary.nvim" },
        opts = {},
    },
}
