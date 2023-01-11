local glob = require("glob")

glob.g.kommentary_create_default_mappings = false

glob.map({
    { "n", "<leader>c", "<Plug>kommentary_line_default", {} },
    { "n", "<c-_>", "<Plug>kommentary_line_default", {} },
    { "x", "<leader>c", "<Plug>kommentary_visual_default", {} },
    { "x", "<c-_>", "<Plug>kommentary_visual_default", {} },
})

return

