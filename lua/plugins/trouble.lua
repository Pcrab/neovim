return {
    "folke/trouble.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {
        -- your configuration comes here
        -- or leave it empty to use the default settings
        -- refer to the configuration section below
    },
    keys = {
        {
            "<leader>xw",
            mode = { "n" },
            function()
                require("trouble").toggle("workspace_diagnostics")
            end,
        },
        {
            "<leader>xd",
            mode = { "n" },
            function()
                require("trouble").toggle("document_diagnostics")
            end,
        },
    },
}
