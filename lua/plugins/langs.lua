-- [nfnl] Compiled from fnl/plugins/langs.fnl by https://github.com/Olical/nfnl, do not edit.
local function _1_()
  vim.g.haskell_tools = {tools = {repl = {handler = "toggleterm"}}}
  return nil
end
return {{"b0o/schemastore.nvim", event = "VeryLazy"}, {"pmizio/typescript-tools.nvim", dependencies = {"nvim-lua/plenary.nvim", "neovim/nvim-lspconfig"}, ft = {"javascript", "typescript", "javascriptreact", "typescriptreact"}, opts = {}}, {"mrcjkb/haskell-tools.nvim", dependencies = {"nvim-lua/plenary.nvim"}, version = "^3", init = _1_, ft = {"haskell", "lhaskell", "cabal", "cabalproject"}}}
