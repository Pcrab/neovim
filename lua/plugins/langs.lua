return {
    -- fish
    { "dag/vim-fish", ft = { "fish" } },
    -- html/xml/react/markdown element editing
    {
        "mattn/emmet-vim",
        ft = { "html", "javascriptreact", "typescriptreact", "xml", "markdown" },
    },
    -- json/yaml schema
    {
        "b0o/schemastore.nvim",
        event = "VeryLazy",
    },
    {
        "pmizio/typescript-tools.nvim",
        dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
        opts = {},
    },
}
