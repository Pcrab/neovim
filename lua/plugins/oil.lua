return {
    "stevearc/oil.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    event = "VeryLazy",
    opts = {},
    cmd = {
        "Oil",
    },
    keys = {
        "-",
        "<cmd>Oil<cr>",
        desc = "Open parent directory",
    },
}
