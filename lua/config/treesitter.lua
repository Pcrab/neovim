local glob = require("glob")

require("nvim-treesitter.configs").setup({
    ensure_installed = "all",
    highlight = {
        enable = true
    }
})

glob.cmd("match Todo /TODO\\(:.*\\)*/")

return
