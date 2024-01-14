[{1 :L3MON4D3/LuaSnip
  :keys [{1 :<C-j>
          2 (fn []
              (let [luasnip (require :luasnip)]
                (if (luasnip.expand_or_jumpable) (luasnip.expand_or_jump))))
          :mode [:i :s]}
         {1 :<C-k>
          2 (fn []
              (let [luasnip (require :luasnip)]
                (if (luasnip.jumpable -1) (luasnip.jump -1))))
          :mode [:i :s]}]
  :config (fn []
            (let [luasnip (require :luasnip)
                  vscode (require :luasnip.loaders.from_vscode)]
              (luasnip.setup {:updateevents [:TextChanged :TextChangedI]})
              (vscode.lazy_load)))
  :event :InsertEnter
  :dependencies [:rafamadriz/friendly-snippets]}]

