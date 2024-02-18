-- [nfnl] Compiled from fnl/plugins/lspconfig.fnl by https://github.com/Olical/nfnl, do not edit.
local function ts(name)
  return ("<CMD>Telescope " .. name .. "<CR>")
end
local function _1_()
  return require("config.lsp")
end
return {{"ray-x/lsp_signature.nvim", event = "VeryLazy", opts = {bind = true, handler_opts = {border = "single"}}}, {"hrsh7th/cmp-nvim-lsp", event = "VeryLazy"}, {"neovim/nvim-lspconfig", event = {"BufReadPre", "BufNewFile"}, dependencies = {"ray-x/lsp_signature.nvim", "hrsh7th/cmp-nvim-lsp", "b0o/schemastore.nvim", "williamboman/mason.nvim", "williamboman/mason-lspconfig.nvim", "WhoIsSethDaniel/mason-tool-installer.nvim", "folke/neoconf.nvim", "Hoffs/omnisharp-extended-lsp.nvim", "kevinhwang91/nvim-ufo"}, config = _1_, keys = {{"gd", ts("lsp_definitions"), mode = "n", desc = "Goto definition"}, {"gD", ts("lsp_type_definitions"), mode = "n", desc = "Goto type definition"}, {"gi", ts("lsp_implementations"), mode = "n", desc = "Goto implementation"}, {"K", vim.lsp.buf.hover, mode = "n", desc = "Display hover information"}, {"gh", vim.lsp.buf.signature_help, mode = "n", desc = "Display hover information"}, {"gr", ts("lsp_references"), mode = "n", desc = "List references"}, {"[d", vim.diagnostic.goto_prev, mode = "n", desc = "Go to previous diagnostic"}, {"]d", vim.diagnostic.goto_next, mode = "n", desc = "Go to next diagnostic"}, {"<leader>d", vim.diagnostic.setloclist, mode = "n", desc = "Set loclist"}, {"<leader>aa", ts("diagnostics"), mode = "n", desc = "Show all workspace diagnostics"}, {"<leader>D", vim.diagnostic.open_float, mode = "n", desc = "Open diagnostic message of current line"}, {"<leader>cl", vim.lsp.codelens.run, mode = "n", desc = "Apply codelens"}, {"<leader>ca", vim.lsp.buf.code_action, mode = "n", desc = "Code action"}, {"<leader>rn", vim.lsp.buf.rename, mode = "n", desc = "Rename"}}}, {"j-hui/fidget.nvim", event = {"BufReadPre", "BufNewFile"}, dependencies = {"neovim/nvim-lspconfig"}, opts = {progress = {poll_rate = 60}, notification = {poll_rate = 60, override_vim_notify = true, window = {max_width = 120}}}}}
