-- require mason first
require("mason").setup()
require("mason-lspconfig").setup()
require("mason-tool-installer").setup({
    ensure_installed = {
        "lua_ls",
        "jsonls",
        "yamlls",
        "stylua",
        "eslint_d",
        "prettierd",
        "rust-analyzer",
    },
})

local capabilities = require("cmp_nvim_lsp").default_capabilities()

local lspconfig = require("lspconfig")
lspconfig.lua_ls.setup({
    capabilities = capabilities,
    settings = {
        Lua = {
            format = { enable = true },
            runtime = {
                version = "LuaJIT",
            },
            diagnostics = {
                globals = { "vim" },
            },
            workspace = {
                checkThirdParty = false,
            },
            telemetry = {
                enable = false,
            },
        },
    },
})

lspconfig.jsonls.setup({
    capabilities = capabilities,
    settings = {
        json = {
            schemas = require("schemastore").json.schemas(),
            validate = { enable = true },
        },
    },
})

lspconfig.yamlls.setup({
    settings = {
        yaml = {
            schemaStore = {
                -- You must disable built-in schemaStore support if you want to use
                -- this plugin and its advanced options like `ignore`.
                enable = false,
                -- Avoid TypeError: Cannot read properties of undefined (reading 'length')
                url = "",
            },
            schemas = require("schemastore").yaml.schemas(),
        },
    },
})

require("typescript-tools").setup({
    handlers = {
        -- ["textDocument/publishDiagnostics"] = require("typescript-tools.api").filter_diagnostics({ 6133 }),
    },
    settings = {
        tsserver_file_preferences = {
            importModuleSpecifierPreference = "non-relative",
        },
    },
})
