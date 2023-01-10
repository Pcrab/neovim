local glob = require("glob")

require("bufferline").setup {
    options = {
        diagnostics = "coc",
    }
}

glob.map({
    { "n", "gb", ":BufferLinePick<cr>", { silent = true } }
})
