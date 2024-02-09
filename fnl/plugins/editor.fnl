[{1 :TimUntersberger/neogit
  :cmd :Neogit
  :dependencies [:nvim-lua/plenary.nvim :sindrets/diffview.nvim]
  :keys [{1 :<leader>gs :mode :n 2 :<CMD>Neogit<CR>}]
  :opts {:integrations {:diffview true}}}
 {1 :windwp/nvim-autopairs :event :InsertEnter :opts {:check_ts true}}
 {1 :numToStr/Comment.nvim
  :event [:BufReadPost :BufNewFile]
  :dependencies [:JoosepAlviste/nvim-ts-context-commentstring]
  :config (fn []
            (let [comment-nvim (require :Comment)
                  commentstring (require :ts_context_commentstring.integrations.comment_nvim)]
              (comment-nvim.setup {:pre_hook (commentstring.create_pre_hook)})))}
 {1 :akinsho/toggleterm.nvim
  :version "*"
  :opts {:open_mapping :<c-t> :direction :float}}
 {1 :akinsho/toggleterm.nvim
  :version "*"
  :opts {:open_mapping :<c-t> :direction :float}}
 {1 :stevearc/conform.nvim
  :dependencies [:mfussenegger/nvim-lint]
  :init (fn []
          (set vim.o.formatexpr "v:lua.require'conform'.formatexpr()"))
  :cmd [:ConformInfo]
  :event [:BufWritePre]
  :opts {:formatters_by_ft {:lua [:stylua]
                            :fennel [:fnlfmt]
                            :haskell [:fourmolu]
                            :javascript [:eslint_d
                                         :eslint
                                         :prettierd
                                         :prettier]
                            :typescript [:eslint_d
                                         :eslint
                                         :prettierd
                                         :prettier]
                            :ocaml [:ocamlformat]
                            :python {:formatters [:isort :black]
                                     :run_all_formatters true}
                            :cs [:csharpier]
                            :markdown []}
         :format_on_save {:timeout_ms 500 :lsp_fallback true}}}
 {1 :mfussenegger/nvim-lint
  :config (fn []
            (let [lint (require :lint)]
              (set lint.linters_by_ft
                   {:javascript [:eslint_d]
                    :typescript [:eslint_d]
                    :javascriptreact [:eslint_d]
                    :typescriptreact [:eslint_d]
                    :fennel [:fennel]})
              (vim.api.nvim_create_autocmd [:BufWritePost]
                                           {:callback (fn []
                                                        (lint.try_lint))})))}
 {1 :nguyenvukhang/nvim-toggler :opts {}}
 {1 :kevinhwang91/nvim-ufo
  :dependencies [:kevinhwang91/promise-async]
  :opts {}
  :init (fn []
          (set vim.o.foldcolumn :1)
          (set vim.o.foldlevel 99)
          (set vim.o.foldlevelstart 99)
          (set vim.o.foldenable true))}
 {1 :nvim-pack/nvim-spectre
  :keys [{1 :<leader>S :mode :n 2 "<CMD>lua require(\"spectre\").toggle()<CR>"}
         {1 :<leader>sw
          :mode :n
          2 "<CMD>lua require(\"spectre\").open_visual({select_word=true})<CR>"}
         {1 :<leader>sw
          :mode :v
          2 "<ESC><CMD>lua require(\"spectre\").open_visual()<CR>"}
         {1 :<leader>sp
          :mode :n
          2 "<ESC><CMD>lua require(\"spectre\").open_file_search({select_word=true})<CR>"}]}
 {1 :kylechui/nvim-surround :version "*" :event :VeryLazy :opts {}}]

