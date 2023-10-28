require("core.opts")
require("core.lazy")
require("core.remap")
require("core.lsp")

vim.cmd.colorscheme("onedark")

vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
