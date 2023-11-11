return {
    "akinsho/toggleterm.nvim",
    version = "*",
    opts = {
        direction = "float",
        float_opts = {
            border = "single",
        },
    },
    keys = {
        { "<C-\\>", mode = { "n", "t", "i" }, "<cmd>ToggleTerm<cr>" },
    },
}
