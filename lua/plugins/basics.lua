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
        "rmagatti/auto-session",
        config = function()
            vim.opt.sessionoptions = "curdir,folds,globals,help,tabpages,terminal,winsize"
            require("auto-session").setup({
                auto_session_suppress_dirs = { "~" },
                session_lens = {
                    load_on_setup = false,
                },
            })
            vim.keymap.set("n", "<leader>sr", "<cmd>SessionRestore<cr>", { desc = "Restore session" })
            vim.keymap.set("n", "<leader>ss", "<cmd>SessionSave<cr>", { desc = "Save session" })
        end,
    },
}
