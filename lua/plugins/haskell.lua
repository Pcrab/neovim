return {
    "mrcjkb/haskell-tools.nvim",
    dependencies = {
        "mfussenegger/nvim-dap",
    },
    version = "^3", -- Recommended
    ft = { "haskell", "lhaskell", "cabal", "cabalproject" },
    config = function()
        vim.g.haskell_tools = {
            dap = {
                auto_discover = true,
            },
        }
    end,
}
