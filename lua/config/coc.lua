local glob = require("glob")
local M = {}

function M.config()
    glob.g.coc_global_extensions = {
        "coc-marketplace",
        "coc-sumneko-lua",
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


    local opts = { silent = true, noremap = true, expr = true }
    glob.map({
        { "n", "<F2>", "<Plug>(coc-rename)", { silent = true } },
        { "n", "gd", "<Plug>(coc-definition)", { silent = true } },
        { "n", "gy", "<Plug>(coc-type-definition)", { silent = true } },
        { "n", "gi", "<Plug>(coc-implementation)", { silent = true } },
        { "n", "gr", "<Plug>(coc-references)", { silent = true } },


        { "i", "<TAB>", "coc#pum#visible() ? coc#pum#next(1) : v:lua.check_back_space() ? '<TAB>' : coc#refresh()", opts },
        { "i", "<S-TAB>", [[coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"]], opts },
        { "i", "<cr>", [[coc#pum#visible() ? coc#pum#confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"]], opts },
    })
end

return M
