return {
    "nvim-neotest/neotest",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-treesitter/nvim-treesitter",
        "antoinemadec/FixCursorHold.nvim",

        -- Elixir
        "jfpedroza/neotest-elixir",
        -- JS
        "haydenmeade/neotest-jest",
    },
    config = function()
        require("neotest").setup({
            adapters = {
                require("neotest-elixir"),
            },
        })
    end,
}
