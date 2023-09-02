require("core.opts")
require("core.lazy")
require("core.remap")

vim.cmd([[colorscheme everforest]])
vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })

