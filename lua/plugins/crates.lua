return {
    "saecki/crates.nvim",
    event = { "BufRead Cargo.toml" },
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
        require("crates").setup({
            src = {
                cmp = {
                    enabled = true,
                },
            },
        })
    end,
}
