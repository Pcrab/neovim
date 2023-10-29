return {
    "folke/trouble.nvim",
    dependencies = {
        "nvim-tree/nvim-web-devicons",
        {
            "folke/todo-comments.nvim",
            dependencies = { "nvim-lua/plenary.nvim" },
            opts = {},
        },
    },
    lazy = false,
    opts = {
        auto_close = true,
    },
    keys = {
        {
            "<leader>xw",
            mode = { "n" },
            function()
                require("trouble").open("workspace_diagnostics")
            end,
            desc = "Workspace Diagnostics",
        },
        {
            "<leader>xd",
            mode = { "n" },
            function()
                require("trouble").open("document_diagnostics")
            end,
            desc = "Document Diagnostics",
        },
        {
            "<leader>xt",
            mode = { "n" },
            "<cmd>TodoTrouble<cr>",
        },
        {
            "gR",
            mode = { "n" },
            function()
                require("trouble").open("lsp_references")
            end,
            desc = "LSP References",
        },
    },
}
