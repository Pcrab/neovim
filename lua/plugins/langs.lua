local lsp = require("core.lsp")
local langs = require("core.langs")

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
        lazy = true,
        config = function()
            langs.servers.jsonls.config = {
                settings = {
                    json = {
                        schemas = require("schemastore").json.schemas(),
                        validate = { enable = true },
                    },
                },
            }
            langs.servers.yamlls.config = {
                settings = {
                    yaml = {
                        schemas = require("schemastore").yaml.schemas(),
                    },
                },
            }
        end,
    },
    {
        "pmizio/typescript-tools.nvim",
        dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
        init = function()
            langs.servers.tsserver.autoload = false
        end,
        config = function()
            local cfg = lsp.make_config(langs.servers.tsserver.config)
            require("typescript-tools").setup(cfg)
        end,
    },
}
