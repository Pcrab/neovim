return {
    cmd = { 'vtsls', '--stdio' },
    filetypes = {
        'javascript',
        'javascriptreact',
        'javascript.jsx',
        'typescript',
        'typescriptreact',
        'typescript.tsx',
    },
    root_marker = { 'tsconfig.json', 'package.json', 'jsconfig.json', '.git' },
    single_file_support = true,
    settings = {
        vtsls = {
            autoUseWorkspaceTsdk = true,
        },
        javascript = {
            implementationsCodeLens = {
                enabled = true,
            },
            referencesCodeLens = {
                enabled = true,
                showOnAllFunctions = true,
            },
            inlayHints = {
                parameterNames = {
                    enabled = true,
                },
                parameterTypes = {
                    enabled = true,
                },
                variableTypes = {
                    enabled = true,
                },
                propertyDeclarationTypes = {
                    enabled = true,
                },
                functionLikeReturnTypes = {
                    enabled = true,
                },
                enumMemberValues = {
                    enabled = true,
                },
            },
        },
        typescript = {
            implementationsCodeLens = {
                enabled = true,
            },
            referencesCodeLens = {
                enabled = true,
                showOnAllFunctions = true,
            },
            inlayHints = {
                parameterNames = {
                    enabled = true,
                },
                parameterTypes = {
                    enabled = true,
                },
                variableTypes = {
                    enabled = true,
                },
                propertyDeclarationTypes = {
                    enabled = true,
                },
                functionLikeReturnTypes = {
                    enabled = true,
                },
                enumMemberValues = {
                    enabled = true,
                },
            },
        },
    },
}
