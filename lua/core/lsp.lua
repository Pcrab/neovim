-- require mason first
require("mason").setup()
require("mason-lspconfig").setup()
require("mason-tool-installer").setup({
    ensure_installed = {
        "csharp_ls",
        "fsautocomplete",
        "fantomas",
        "omnisharp",
        "csharpier",
        "lua_ls",
        "jsonls",
        "yamlls",
        "stylua",
        "eslint_d",
        "prettierd",
        "astro",
        "svelte",
        "rust-analyzer",
        "tsserver",
        "prismals",
        -- "kotlin_language_server",
    },
})

local capabilities = require("cmp_nvim_lsp").default_capabilities()
capabilities.textDocument.foldingRange = {
    dynamicRegistration = false,
    lineFoldingOnly = true,
}

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
    capabilities = capabilities,
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

-- lspconfig.csharp_ls.setup({
--     capabilities = capabilities,
-- })
lspconfig.omnisharp.setup({
    capabilities = capabilities,
    handlers = {
        ["textDocument/definition"] = require("omnisharp_extended").handler,
    },
})

lspconfig.astro.setup({
    capabilities = capabilities,
})
lspconfig.svelte.setup({
    capabilities = capabilities,
})
lspconfig.unocss.setup({
    capabilities = capabilities,
})
lspconfig.prismals.setup({
    capabilities = capabilities,
})

-- lspconfig.kotlin_language_server.setup({
--     capabilities = capabilities,
-- })

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
