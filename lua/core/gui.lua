local glob = require("glob")

glob.opt.list = true
glob.opt.listchars:append "space:⋅"
-- vim.opt.listchars:append "eol:↴"

require("indent_blankline").setup {
    space_char_blankline = " ",
    show_current_context = true,
    show_current_context_start = true,
}

require("gruvbox").setup({
    transparent_mode = true,
})
glob.cmd([[colorscheme gruvbox]])
