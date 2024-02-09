[{1 :stevearc/dressing.nvim :event :VeryLazy :opts {}}
 {1 :kevinhwang91/nvim-bqf :ft :qf}
 {1 :lewis6991/gitsigns.nvim
  :opts {:signs {:add {:text "│"}
                 :change {:text "│"}
                 :delete {:text "_"}
                 :topdelete {:text "‾"}
                 :changedelete {:text "~"}
                 :untracked {:text "┆"}}
         :signcolumn true
         :numhl true
         :linehl false
         :word_diff false
         :watch_gitdir {:follow_files true}
         :attach_to_untracked true
         :current_line_blame true
         :current_line_blame_opts {:virt_text true
                                   :virt_text_pos :eol
                                   :delay 0
                                   :ignore_whitespace false}
         :current_line_blame_formatter "<author>, <author_time:%Y-%m-%d> - <summary>"
         :sign_priority 6
         :update_debounce 100
         :status_formatter nil
         :max_file_length 40000
         :preview_config {:border :single
                          :style :minimal
                          :relative :cursor
                          :row 0
                          :col 1}
         :yadm {:enable false}}}
 {1 :kevinhwang91/nvim-hlslens
  :lazy false
  :keys [{1 :n
          2 "<Cmd>execute('normal! ' . v:count1 . 'n')<CR><Cmd>lua require('hlslens').start()<CR>"
          :mode [:n]
          :desc :hlslens}
         {1 :N
          2 "<Cmd>execute('normal! ' . v:count1 . 'N')<CR><Cmd>lua require('hlslens').start()<CR>"
          :mode [:n]
          :desc :hlslens}
         {1 "*"
          2 "*<Cmd>lua require('hlslens').start()<CR>"
          :mode [:n]
          :desc :hlslens}
         {1 "#"
          2 "#<Cmd>lua require('hlslens').start()<CR>"
          :mode [:n]
          :desc :hlslens}
         {1 :g*
          2 "g*<Cmd>lua require('hlslens').start()<CR>"
          :mode [:n]
          :desc :hlslens}
         {1 "g#"
          2 "g#<Cmd>lua require('hlslens').start()<CR>"
          :mode [:n]
          :desc :hlslens}
         {1 :<BS> 2 :<Cmd>noh<CR> :mode [:n] :desc :noh}]
  :opts {}}]

