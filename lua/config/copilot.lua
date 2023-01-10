local glob = require("glob")

glob.g.copilot_no_tab_map = true
glob.map({
    { "i", "<Right>", "copilot#Accept('<Right>')", { script = true, silent = true, expr = true } }
})
