local values = require("core.values")

return {
    {
        "neanias/everforest-nvim",
        version = false,
        enabled = values.theme.name == "everforest",
        lazy = false,
        priority = 1000, -- make sure to load this before all the other start plugins
        -- Optional; default configuration will be used if setup isn't called.
        config = function()
            require("everforest").setup({
                -- Your config here
                transparent_background_level = 1,
            })
            require("everforest").load()
        end,
    },
    {
        "olimorris/onedarkpro.nvim",
        enabled = values.theme.name == "onedarkpro",
        config = function()
            vim.cmd.colorscheme("onedarkpro")
        end,
    },
    {
        "rose-pine/neovim",
        name = "rose-pine",
        enabled = values.theme.name == "rose-pine",
        config = function()
            require("rose-pine").setup({ variant = values.theme.variant })
            values.theme.palette = require("rose-pine.palette")
            vim.cmd.colorscheme("rose-pine")
        end,
    },
    {
        "miikanissi/modus-themes.nvim",
        enabled = values.theme.name == "modus-themes",
        priority = 1000,
        opts = {
            transparent = true,
        },
        config = function()
            vim.cmd.colorscheme("modus")
        end,
    },
}
