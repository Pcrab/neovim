[{1 "folke/which-key.nvim"
  :event :VeryLazy
  :opts {}}
 ; {1 "folke/neoconf.nvim"
 ;  :priority 0
 ;  :lazy false
 ;  :opts {}}
 {1 "wakatime/vim-wakatime"}
 {1 "folke/persistence.nvim"
  :opts {}
  :event :BufReadPre
  :keys [{1 "<leader>s"
          :mode "n"
          2 (fn []
              (let [persistence (require :persistence)]
                (persistence.load)))
          :desc "Load session"}]}]
