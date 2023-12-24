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
    {
        "Wansmer/treesj",
        keys = { "<space>m" },
        dependencies = { "nvim-treesitter/nvim-treesitter" },
        config = function()
            require("treesj").setup({--[[ your config ]]
            })
        end,
    },
    {
        "mrcjkb/rustaceanvim",
        version = "^3", -- Recommended
        ft = { "rust" },
    },
    {
        "scalameta/nvim-metals",
        dependencies = {
            "nvim-lua/plenary.nvim",
        },
        ft = { "scala", "sbt", "java" },
        config = function(self)
            local metals = require("metals")
            local config = metals.bare_config()
            config.settings = {
                showImplicitArguments = true,
            }
            config.on_attach = function(client, bufnr)
                require("metals").setup_dap()

                vim.keymap.set("n", "<leader>ws", function()
                    require("metals").hover_worksheet()
                end)

                vim.keymap.set("n", "<leader>fs", function()
                    require("telescope").extensions.metals.commands()
                end)
            end
            local nvim_metals_group = vim.api.nvim_create_augroup("nvim-metals", { clear = true })
            vim.api.nvim_create_autocmd("FileType", {
                pattern = self.ft,
                callback = function()
                    require("metals").initialize_or_attach(config)
                end,
                group = nvim_metals_group,
            })
        end,
    },
    {
        "tpope/vim-dadbod",
        dependencies = {
            "kristijanhusak/vim-dadbod-ui",
            "kristijanhusak/vim-dadbod-completion",
        },
    },
    {
        "rest-nvim/rest.nvim",
        ft = { "http" },
        dependencies = { { "nvim-lua/plenary.nvim" } },
        opts = {},
        keys = {
            {
                "<leader>rr",
                [[<Plug>RestNvim]],
                { mode = { "n" }, noremap = true, silent = true },
            },
            {
                "<leader>rl",
                [[<Plug>RestNvimLast]],
                { noremap = true, silent = true },
            },
        },
    },
}
