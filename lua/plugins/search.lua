return {
    {
        "nvim-telescope/telescope.nvim",
        event = "VeryLazy",
        dependencies = {
            { "nvim-lua/plenary.nvim" },
            { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
            { "nvim-telescope/telescope-file-browser.nvim", dependencies = { "nvim-tree/nvim-web-devicons" } },
            { "nvim-telescope/telescope-ui-select.nvim" },
        },
        keys = {
            {
                "<leader>ff",
                mode = { "n" },
                function()
                    require("telescope.builtin").find_files()
                end,
                desc = "Find files",
            },
            {
                "<leader>fg",
                mode = { "n" },
                function()
                    require("telescope.builtin").live_grep()
                end,
                desc = "Live grep",
            },
            {
                "<leader>fb",
                mode = { "n" },
                function()
                    require("telescope.builtin").buffers()
                end,
                desc = "Find buffer",
            },
            {
                "<leader>fh",
                mode = { "n" },
                function()
                    require("telescope.builtin").help_tags()
                end,
                desc = "Find help",
            },
            {
                "<leader>fy",
                mode = { "n" },
                function()
                    require("telescope.builtin").lsp_workspace_symbols()
                end,
                desc = "Find lsp symbols",
            },
            {
                "<leader>fb",
                mode = { "n" },
                function()
                    require("telescope").extensions.file_browser.file_browser()
                end,
                desc = "Find session",
            },
        },
        config = function()
            require("telescope").setup({
                defaults = {
                    preview = {
                        filesize_limit = 0.5,
                        timeout = 100,
                    },
                },
                extensions = {
                    fzf = {
                        fuzzy = true,
                        override_generic_sorter = true,
                        override_file_sorter = true,
                        case_mode = "smart_case", -- or "ignore_case" or "respect_case"
                    },
                    file_browser = {
                        -- disables netrw and use telescope-file-browser in its place
                        hijack_netrw = true,
                    },
                    ["ui-select"] = {
                        require("telescope.themes").get_dropdown({
                            -- even more opts
                        }),
                    },
                },
            })

            require("telescope").load_extension("fzf")
            require("telescope").load_extension("file_browser")
            require("telescope").load_extension("ui-select")
        end,
    },
    {
        "wintermute-cell/gitignore.nvim",
        dependencies = {
            "nvim-telescope/telescope.nvim",
        },
        keys = {
            {
                "<leader>gi",
                mode = { "n" },
                function()
                    require("gitignore").generate(".")
                end,
                desc = "Generate gitignore file",
            },
        },
    },
}
