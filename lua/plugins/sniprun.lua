return {
    "michaelb/sniprun",
    build = "bash install.sh",
    keys = {
        { "<leader>sr", "<Cmd>SnipRun<CR>", mode = { "n", "v" }, desc = "Run" },
    },
}
