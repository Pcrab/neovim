[{1 :nvim-treesitter/nvim-treesitter
  :build ":TSUpdate"
  :event ["BufReadPost" "BufNewFile"]
  :cmd ["TSUpdate" "TSUpdateSync"]
  :dependencies [
            "windwp/nvim-ts-autotag"
            "nvim-treesitter/nvim-treesitter-textobjects"
            "kevinhwang91/nvim-ufo"
            ]
  :config (fn []
            (let [treesitter (require :nvim-treesitter.configs)]
              (treesitter.setup {:highlight {:enable true}
                                 :indent {:enable true}
                                 :ensure_installed "all"
                                 :autotag {
                                    :enable true
                                    :enable_rename true
                                    :enable_close true
                                    :enable_close_on_slash true}
                                 :textobjects {:select {:enable true}
                                               :move {:enable true}}})))}]
