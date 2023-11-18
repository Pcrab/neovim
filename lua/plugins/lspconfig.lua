local values = require("core.values")
local lsp = require("core.lsp")
local langs = require("core.langs")

return {
    -- # load before nvim-lspconfig
    {
        "ray-x/lsp_signature.nvim",
        lazy = true,
        config = function()
            lsp.on_attach_callbacks[#lsp.on_attach_callbacks + 1] = function(_, _)
                require("lsp_signature").on_attach({ bind = true, handler_opts = { border = "none" } })
            end
        end,
    },
    {
        "hrsh7th/cmp-nvim-lsp",
        lazy = true,
        config = function()
            lsp.capabilities[#lsp.capabilities + 1] = require("cmp_nvim_lsp").default_capabilities
        end,
    },
    -- # nvim-lspconfig
    {
        "neovim/nvim-lspconfig",
        event = { "BufReadPre", "BufNewFile" },
        config = function()
            local lspconfig = require("lspconfig")
            lsp.make_config = function(server, on_attach, caps_maker)
                local config = server.config or {}
                if server.root_patterns then
                    config.root_dir = require("lspconfig.util").root_pattern(unpack(server.root_patterns))
                end
                config.on_attach = lsp.on_attach(on_attach)
                config.capabilities = lsp.make_capabilities(caps_maker)
                return config
            end
            for name, srv in pairs(langs.servers) do
                if srv.autoload then
                    lspconfig[name].setup(lsp.make_config(srv))
                end
            end
        end,
        dependencies = {
            "ray-x/lsp_signature.nvim",
            "hrsh7th/cmp-nvim-lsp",
            "b0o/schemastore.nvim",
            "folke/neoconf.nvim",
        },
    },
    -- # load after nvim-lspconfig
    {
        "folke/trouble.nvim",
        cmd = "TroubleToggle",
        keys = { { "<leader>xx", ":TroubleToggle<CR>", "n", desc = "Toggle trouble quickfix" } },
        dependencies = { "nvim-tree/nvim-web-devicons", "neovim/nvim-lspconfig" },
        config = function()
            require("trouble").setup({
                signs = {
                    error = values.diagnostic_signs.Error,
                    warning = values.diagnostic_signs.Warn,
                    information = values.diagnostic_signs.Info,
                    hint = values.diagnostic_signs.Hint,
                    other = "󰗡",
                },
            })
        end,
    },
    {
        "j-hui/fidget.nvim",
        event = { "BufReadPre", "BufNewFile" },
        enabled = not values.use_noice,
        dependencies = { "neovim/nvim-lspconfig" },
        config = function()
            require("fidget").setup({
                progress = {
                    poll_rate = 60,
                },
                notification = {
                    poll_rate = 60,
                    override_vim_notify = true,
                    window = {
                        max_width = 120,
                    },
                },
            })
        end,
    },
    {
        "kosayoda/nvim-lightbulb",
        opts = {
            sign = { enabled = false },
            virtual_text = { enabled = true, text = "" },
            autocmd = { enabled = true },
            float = {},
        },
    },
}