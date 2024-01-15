-- [nfnl] Compiled from fnl/plugins/completion.fnl by https://github.com/Olical/nfnl, do not edit.
local function _1_()
  local cmp = require("cmp")
  local luasnip = require("luasnip")
  local function _2_(args)
    return luasnip.lsp_expand(args.body)
  end
  cmp.setup({window = {completion = {col_offset = -3}}, snippet = {expand = _2_}, mapping = {["<C-p>"] = cmp.mapping(cmp.mapping.select_prev_item(), {"i", "c"}), ["<C-n>"] = cmp.mapping(cmp.mapping.select_next_item(), {"i", "c"}), ["<CR>"] = cmp.mapping.confirm({select = true})}, sources = cmp.config.sources({{name = "nvim_lsp"}, {name = "luasnip"}, {name = "conjure"}}, {{name = "buffer"}, {name = "path"}})})
  cmp.setup.cmdline(":", {completion = {completeopt = "menu,menuone,noselect"}, sources = cmp.config.sources({{name = "path"}, {name = "cmdline"}})})
  return cmp.setup.cmdline({"/", "?"}, {completion = {completeopt = "menu,menuone,noselect"}, sources = {{name = "buffer"}}})
end
local function _3_()
  vim.g.copilot_no_tab_map = true
  return nil
end
local function _4_()
  local copilot = require("copilot")
  return copilot.setup({suggestion = {auto_trigger = true, keymap = {accept = "<C-e>", next = "<C-.>", pref = "<C-,>"}}})
end
return {{"hrsh7th/nvim-cmp", event = {"InsertEnter", "CmdlineEnter"}, dependencies = {"hrsh7th/cmp-buffer", "hrsh7th/cmp-nvim-lsp", "hrsh7th/cmp-nvim-lsp-signature-help", "hrsh7th/cmp-buffer", "hrsh7th/cmp-path", "hrsh7th/cmp-cmdline", "L3MON4D3/LuaSnip", "saadparwaiz1/cmp_luasnip", "PaterJason/cmp-conjure"}, config = _1_}, {"zbirenbaum/copilot.lua", init = _3_, cmd = "Copilot", event = "InsertEnter", config = _4_}}
