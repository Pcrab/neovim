-- [nfnl] Compiled from fnl/plugins/lspconfig.fnl by https://github.com/Olical/nfnl, do not edit.
local function _1_()
  return require("config.lsp")
end
local function _2_()
  return vim.diagnostic.setqflist({severity = "E"})
end
local function _3_()
  return vim.diagnostic.setqflist({severity = "W"})
end
return {{"ray-x/lsp_signature.nvim", event = "VeryLazy", opts = {bind = true, handler_opts = {border = "single"}}}, {"hrsh7th/cmp-nvim-lsp", event = "VeryLazy"}, {"neovim/nvim-lspconfig", event = {"BufReadPre", "BufNewFile"}, dependencies = {"ray-x/lsp_signature.nvim", "hrsh7th/cmp-nvim-lsp", "b0o/schemastore.nvim", "williamboman/mason.nvim", "williamboman/mason-lspconfig.nvim", "WhoIsSethDaniel/mason-tool-installer.nvim", "folke/neoconf.nvim", "Hoffs/omnisharp-extended-lsp.nvim", "kevinhwang91/nvim-ufo"}, config = _1_, keys = {{"gd", vim.lsp.buf.definition, mode = "n", desc = "Goto definition"}, {"gD", vim.lsp.buf.type_definition, mode = "n", desc = "Goto type definition"}, {"gi", vim.lsp.buf.implementation, mode = "n", desc = "Goto implementation"}, {"K", vim.lsp.buf.signature_help, mode = "n", desc = "Display hover information"}, {"gh", vim.lsp.buf.signature_help, mode = "n", desc = "Display hover information"}, {"gr", vim.lsp.buf.references, mode = "n", desc = "List references"}, {"[d", vim.diagnostic.goto_prev, mode = "n", desc = "Go to previous diagnostic"}, {"]d", vim.diagnostic.goto_next, mode = "n", desc = "Go to next diagnostic"}, {"<leader>d", vim.diagnostic.setloclist, mode = "n", desc = "Set loclist"}, {"<leader>aa", vim.diagnostic.setqflist, mode = "n", desc = "Show all workspace diagnostics"}, {"<leader>ae", _2_, mode = "n", desc = "Show all workspace errors"}, {"<leader>aw", _3_, mode = "n", desc = "Show all workspace warnings"}, {"<leader>ca", vim.lsp.buf.code_action, mode = "n", desc = "Code action"}, {"<leader>rn", vim.lsp.buf.rename, mode = "n", desc = "Rename"}}}, {"j-hui/fidget.nvim", event = {"BufReadPre", "BufNewFile"}, dependencies = {"neovim/nvim-lspconfig"}, opts = {progress = {poll_rate = 60}, notification = {poll_rate = 60, override_vim_notify = true, window = {max_width = 120}}}}}
