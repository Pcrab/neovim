[{1 :hrsh7th/nvim-cmp
  :event [:InsertEnter :CmdlineEnter]
  :dependencies [:hrsh7th/cmp-buffer
                 :hrsh7th/cmp-nvim-lsp
                 :hrsh7th/cmp-nvim-lsp-signature-help
                 :hrsh7th/cmp-buffer
                 :hrsh7th/cmp-path
                 :hrsh7th/cmp-cmdline
                 :L3MON4D3/LuaSnip
                 :saadparwaiz1/cmp_luasnip
                 :PaterJason/cmp-conjure]
  :config (fn []
            (let [cmp (require :cmp)
                  luasnip (require :luasnip)]
              (cmp.setup {:window {:completion {:col_offset -3}}
                          :snippet {:expand (fn [args]
                                              (luasnip.lsp_expand args.body))}
                          :mapping {:<C-p> (cmp.mapping (cmp.mapping.select_prev_item)
                                                        [:i :c])
                                    :<C-n> (cmp.mapping (cmp.mapping.select_next_item)
                                                        [:i :c])
                                    :<CR> (cmp.mapping.confirm {:select true})}
                          :sources (cmp.config.sources [{:name :nvim_lsp}
                                                        {:name :luasnip}
                                                        {:name :conjure}]
                                                       [{:name :buffer}
                                                        {:name :path}])})
              (cmp.setup.cmdline ":"
                                 {:completion {:completeopt "menu,menuone,noselect"}
                                  :sources (cmp.config.sources [{:name :path}
                                                                {:name :cmdline}])})
              (cmp.setup.cmdline ["/" "?"]
                                 {:completion {:completeopt "menu,menuone,noselect"}
                                  :sources [{:name :buffer}]})))}
 {1 :zbirenbaum/copilot.lua
  :init (fn []
          (set vim.g.copilot_no_tab_map true))
  :cmd :Copilot
  :event :InsertEnter
  :config (fn []
            (let [copilot (require :copilot)]
              (copilot.setup {:suggestion {:auto_trigger true
                                           :keymap {:accept :<C-e>
                                                    :next :<C-.>
                                                    :pref "<C-,>"}}})))}]

