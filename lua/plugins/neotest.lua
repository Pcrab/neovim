return {
    "nvim-neotest/neotest",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-treesitter/nvim-treesitter",
        "antoinemadec/FixCursorHold.nvim",

        -- JS
        "haydenmeade/neotest-jest",

        -- haskell
        "MrcJkb/neotest-haskell",
    },
    config = function()
        require("neotest").setup({
            adapters = {
                require("neotest-haskell"),
                require("neotest-jest")({
                    jestCommand = "pnpm test --",
                    jestConfigFile = "custom.jest.config.ts",
                    env = { CI = true },
                    cwd = function(path)
                        return vim.fn.getcwd()
                    end,
                }),
            },
        })
    end,
    keys = {
        {
            "<leader>nr",
            function()
                require("neotest").run.run()
            end,
            desc = "run nearest",
        },
        {
            "<leader>nf",
            function()
                require("neotest").run.run(vim.api.nvim_buf_get_name(0))
            end,
            desc = "run file",
        },
        {
            "<leader>no",
            function()
                require("neotest").output.open()
            end,
            desc = "open output",
        },
        {
            "<leader>ns",
            function()
                require("neotest").summary.toggle()
            end,
            desc = "toggle summary",
        },
        {
            "<leader>nr",
            function()
                require("neotest").run.run()
            end,
            desc = "run nearest",
        },
    },
}
