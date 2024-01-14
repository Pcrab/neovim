-- [nfnl] Compiled from fnl/plugins/snippet.fnl by https://github.com/Olical/nfnl, do not edit.
local function _1_()
  local luasnip = require("luasnip")
  if luasnip.expand_or_jumpable() then
    return luasnip.expand_or_jump()
  else
    return nil
  end
end
local function _3_()
  local luasnip = require("luasnip")
  if luasnip.jumpable(-1) then
    return luasnip.jump(-1)
  else
    return nil
  end
end
local function _5_()
  local luasnip = require("luasnip")
  local vscode = require("luasnip.loaders.from_vscode")
  luasnip.setup({updateevents = {"TextChanged", "TextChangedI"}})
  return vscode.lazy_load()
end
return {{"L3MON4D3/LuaSnip", keys = {{"<C-j>", _1_, mode = {"i", "s"}}, {"<C-k>", _3_, mode = {"i", "s"}}}, config = _5_, event = "InsertEnter", dependencies = {"rafamadriz/friendly-snippets"}}}
