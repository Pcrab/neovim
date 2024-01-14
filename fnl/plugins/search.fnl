[{1 :nvim-telescope/telescope.nvim
  :event :VeryLazy
  :dependencies [:nvim-lua/plenary.nvim
                 {1 :nvim-telescope/telescope-fzf-native.nvim :build :make}
                 :nvim-telescope/telescope-ui-select.nvim]
  :keys [{1 :<leader>ff
          2 (fn []
              (let [telescope (require :telescope.builtin)]
                (telescope.find_files)))
          :mode :n
          :desc "Find files"}
         {1 :<leader>fg
          2 (fn []
              (let [telescope (require :telescope.builtin)]
                (telescope.live_grep)))
          :mode :n
          :desc "Live grep"}
         {1 :<leader>fh
          2 (fn []
              (let [telescope (require :telescope.builtin)]
                (telescope.help_tags)))
          :mode :n
          :desc "Find helps"}
         {1 :<leader>fb
          2 (fn []
              (let [telescope (require :telescope.builtin)]
                (telescope.buffers)))
          :mode :n
          :desc "Find buffers"}]
  :config (fn []
            (let [telescope (require :telescope)]
              (telescope.setup {:defaults {:preview {:filesize_limit 0.5
                                                     :timeout 100}}
                                :extensions {:fzf {:fuzzy true
                                                   :override_generic_sorter true
                                                   :override_file_sorter true
                                                   :case_mode :smart_case}}})
              (telescope.load_extension :fzf)
              (telescope.load_extension :ui-select)))}]

