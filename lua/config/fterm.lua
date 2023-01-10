local glob = require("glob")

require("FTerm").setup({})

glob.map({
    { "n", "<A-i>", "<CMD>lua require('FTerm').toggle()<cr>" },
    { "t", "<A-i>", "<C-\\><C-n><CMD>lua require('FTerm').toggle()<cr>" },
})

return
