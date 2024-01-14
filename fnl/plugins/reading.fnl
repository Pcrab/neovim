[{1 :lukas-reineke/indent-blankline.nvim
  :dependencies [:nvim-treesitter/nvim-treesitter]
  :event [:BufReadPre :BufNewFile]
  :main :ibl
  :opts {:indent {:char "¦"}
         :exclude {:buftypes [:help
                              :nofile
                              :nowrite
                              :quickfix
                              :terminal
                              :prompt]}
         :scope {:enabled false}}}
 {1 :chrisgrieser/nvim-spider
  :keys [{1 :e
          2 (fn []
              (let [spider (require :spider)]
                (spider.motion :e)))
          :mode [:n :o :x]}
         {1 :w
          2 (fn []
              (let [spider (require :spider)]
                (spider.motion :w)))
          :mode [:n :o :x]}
         {1 :b
          2 (fn []
              (let [spider (require :spider)]
                (spider.motion :b)))
          :mode [:n :o :x]}]}]

