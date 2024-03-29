return {
    {
        "nvim-neo-tree/neo-tree.nvim",
        cmd = { "Neotree" },
        keys = {
            { "<leader>fn", mode = { "n" }, "<cmd>Neotree toggle<cr>", desc = "Toggle filetree" },
            { "<leader>fG", mode = { "n" }, "<cmd>Neotree source=git_status reveal=true toggle<cr>" },
            { "<leader>fr", mode = { "n" }, "<cmd>Neotree reveal=true toggle<cr>" },
        },
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-tree/nvim-web-devicons",
            "MunifTanjim/nui.nvim",
        },
        opts = {
            filesystem = {
                filtered_items = {
                    hide_dotfiles = false,
                },
            },
        },
    },
    -- filesystem editor
    {
        "stevearc/oil.nvim",
        cmd = { "Oil" },
        keys = {
            { "<Leader>fe", ":vsplit | Oil .<CR>", "n", desc = "Open files editor Window" },
            { "<leader>te", ":tabnew | Oil .<CR>", "n", desc = "Open files editor Tab" },
        },
        opts = {},
        dependencies = { "nvim-tree/nvim-web-devicons" },
    },
    {
        "mrjones2014/smart-splits.nvim",
        opts = {
            ignored_buftypes = { "neo-tree" },
        },
        keys = {
            {
                "<C-H>",
                function()
                    require("smart-splits").swap_buf_left()
                end,
                "n",
                desc = "Swap left window",
            },
            {
                "<C-J>",
                function()
                    require("smart-splits").swap_buf_down()
                end,
                "n",
                desc = "Swap bottom window",
            },
            {
                "<C-K>",
                function()
                    require("smart-splits").swap_buf_up()
                end,
                "n",
                desc = "Swap top window",
            },
            {
                "<C-L>",
                function()
                    require("smart-splits").swap_buf_right()
                end,
                "n",
                desc = "Swap right window",
            },

            {
                "<C-S-Left>",
                function()
                    require("smart-splits").resize_left()
                end,
                "n",
                desc = "Resize left window",
            },
            {
                "<C-S-Down>",
                function()
                    require("smart-splits").resize_down()
                end,
                "n",
                desc = "Resize bottom window",
            },
            {
                "<C-S-Up>",
                function()
                    require("smart-splits").resize_up()
                end,
                "n",
                desc = "Resize top window",
            },
            {
                "<C-S-Right>",
                function()
                    require("smart-splits").resize_right()
                end,
                "n",
                desc = "Resize right window",
            },
        },
    },
}
