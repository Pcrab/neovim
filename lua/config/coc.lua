local glob = require("glob")
local M = {}

function M.config()
    glob.g.coc_global_extensions = {
        "coc-marketplace",
        "coc-lua",
        "coc-sh",

        "coc-tsserver",
        "coc-json",
        "coc-html",
        "coc-css",
        "coc-prettier",
        "coc-eslint",

        "coc-clangd",

        "coc-git",
        "coc-snippets",
        "coc-pairs",
        "coc-word",
    }
end

function M.setup()
    glob.cmd("command! -nargs=? Fold :call CocAction('fold', <f-args>)")
    glob.cmd("hi! link CocPum Pmenu")
    glob.cmd("hi! link CocMenuSel PmenuSel")
    -- Scss
    glob.cmd("autocmd FileType scss setl iskeyword+=@-@")

    glob.api.nvim_create_user_command("Format", "call CocAction('format')", {})

    local opts = { silent = true, noremap = true, expr = true }
    glob.map({
        { "n", "<F2>", "<Plug>(coc-rename)", { silent = true } },
        { "n", "gd", "<Plug>(coc-definition)", { silent = true } },
        { "n", "gy", "<Plug>(coc-type-definition)", { silent = true } },
        { "n", "gi", "<Plug>(coc-implementation)", { silent = true } },
        { "n", "gr", "<Plug>(coc-references)", { silent = true } },
        { "x", "if", "<Plug>(coc-funcobj-i)", { silent = true } },
        { "o", "if", "<Plug>(coc-funcobj-i)", { silent = true } },
        { "x", "af", "<Plug>(coc-funcobj-a)", { silent = true } },
        { "o", "af", "<Plug>(coc-funcobj-a)", { silent = true } },
        { "x", "ic", "<Plug>(coc-classobj-i)", { silent = true } },
        { "o", "ic", "<Plug>(coc-classobj-i)", { silent = true } },
        { "x", "ac", "<Plug>(coc-classobj-a)", { silent = true } },
        { "o", "ac", "<Plug>(coc-classobj-a)", { silent = true } },

        { "n", "K", ":call CocAction('doHover')<cr>", {silent = true} },

        { "n", "[g", "<Plug>(coc-diagnostic-prev)", {silent = true} },
        { "n", "]g", "<Plug>(coc-diagnostic-next)", {silent = true} },
        { "n", "<C-e>", ":CocList --auto-preview diagnostics<cr>", { silent = true } },

        { "i", "<TAB>", "coc#pum#visible() ? coc#pum#next(1) : col('.') == 1 || getline('.')[col('.') - 2] =~# '\\s' ? \"\\<TAB>\" : coc#refresh()", opts },
        { "i", "<s-tab>", "coc#pum#visible() ? coc#pum#prev(1) : \"\\<s-tab>\"", opts },
        { "i", "<cr>", [[coc#pum#visible() ? coc#pum#confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"]], opts },

        { "x", "=", "CocHasProvider('formatRange') ? '<Plug>(coc-format-selected)' : '='", opts },
        { "n", "=", "CocHasProvider('formatRange') ? '<Plug>(coc-format-selected)' : '='", opts },

        { "n", "<leader>ac", "<Plug>(coc-codeaction-cursor)", { silent = true, nowait = true } },
        { "n", "<leader>as", "<Plug>(coc-codeaction-source)", { silent = true, nowait = true } },
        { "n", "<leader>ac", "<Plug>(coc-codeaction)", opts },


    })
end

return M
