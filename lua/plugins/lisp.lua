-- [nfnl] Compiled from fnl/plugins/lisp.fnl by https://github.com/Olical/nfnl, do not edit.
local function _1_()
  vim.g["conjure#mapping#doc_word"] = false
  return nil
end
return {{"Olical/conjure", ft = {"clojure", "edn", "fennel", "lisp", "racket"}, config = _1_}, {"eraserhd/parinfer-rust", ft = {"clojure", "edn", "fennel", "lisp", "racket"}, build = "cargo build --release"}}
