local values = require("core.values")

return {
    {
        "olimorris/onedarkpro.nvim",
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
}
