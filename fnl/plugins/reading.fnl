[{1 :lukas-reineke/indent-blankline.nvim
  :dependencies [:nvim-treesitter/nvim-treesitter
                 "https://gitlab.com/HiPhish/rainbow-delimiters.nvim"]
  :event [:BufReadPre :BufNewFile]
  :main :ibl
  :config (fn []
            (let [highlight [:RainbowRed
                             :RainbowYellow
                             :RainbowBlue
                             :RainbowOrange
                             :RainbowGreen
                             :RainbowViolet
                             :RainbowCyan]
                  hooks (require :ibl.hooks)]
              (hooks.register hooks.type.HIGHLIGHT_SETUP
                              (fn []
                                (vim.api.nvim_set_hl 0 :RainbowRed
                                                     {:fg "#E06C75"})
                                (vim.api.nvim_set_hl 0 :RainbowYellow
                                                     {:fg "#E5C07B"})
                                (vim.api.nvim_set_hl 0 :RainbowBlue
                                                     {:fg "#61AFEF"})
                                (vim.api.nvim_set_hl 0 :RainbowOrange
                                                     {:fg "#D19A66"})
                                (vim.api.nvim_set_hl 0 :RainbowGreen
                                                     {:fg "#98C379"})
                                (vim.api.nvim_set_hl 0 :RainbowViolet
                                                     {:fg "#C678DD"})
                                (vim.api.nvim_set_hl 0 :RainbowCyan
                                                     {:fg "#56B6C2"})))
              (set vim.g.rainbow_delimiters {: highlight})
              ((. (require :ibl) :setup) {:indent {: highlight}})
              (hooks.register hooks.type.SCOPE_HIGHLIGHT
                              hooks.builtin.scope_highlight_from_extmark)))}
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

