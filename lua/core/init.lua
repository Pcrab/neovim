require("core.opts")
require("core.lazy")
require("core.remap")

require("github-theme").setup({})
vim.cmd("colorscheme github_dark")

vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
