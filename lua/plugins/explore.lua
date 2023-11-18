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
}