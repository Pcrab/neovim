[{1 :ray-x/lsp_signature.nvim
  :event :VeryLazy
  :opts {:bind true :handler_opts {:border :single}}}
 {1 :hrsh7th/cmp-nvim-lsp :event :VeryLazy}
 {1 :neovim/nvim-lspconfig
  :event [:BufReadPre :BufNewFile]
  :dependencies [:ray-x/lsp_signature.nvim
                 :hrsh7th/cmp-nvim-lsp
                 :b0o/schemastore.nvim
                 :williamboman/mason.nvim
                 :williamboman/mason-lspconfig.nvim
                 :WhoIsSethDaniel/mason-tool-installer.nvim
                 :folke/neoconf.nvim
                 :Hoffs/omnisharp-extended-lsp.nvim
                 :kevinhwang91/nvim-ufo]
  :config (fn []
            (require :config.lsp))
  :keys [{1 :gd 2 vim.lsp.buf.definition :mode :n :desc "Goto definition"}
         {1 :gD
          2 vim.lsp.buf.type_definition
          :mode :n
          :desc "Goto type definition"}
         {1 :gi
          2 vim.lsp.buf.implementation
          :mode :n
          :desc "Goto implementation"}
         {1 :K
          2 vim.lsp.buf.signature_help
          :mode :n
          :desc "Display hover information"}
         {1 :gh
          2 vim.lsp.buf.signature_help
          :mode :n
          :desc "Display hover information"}
         {1 :gr 2 vim.lsp.buf.references :mode :n :desc "List references"}
         {1 "[d"
          2 vim.diagnostic.goto_prev
          :mode :n
          :desc "Go to previous diagnostic"}
         {1 "]d"
          2 vim.diagnostic.goto_next
          :mode :n
          :desc "Go to next diagnostic"}
         {1 :<leader>d
          2 vim.diagnostic.setloclist
          :mode :n
          :desc "Set loclist"}
         {1 :<leader>aa
          2 vim.diagnostic.setqflist
          :mode :n
          :desc "Show all workspace diagnostics"}
         {1 :<leader>ae
          2 (fn []
              (vim.diagnostic.setqflist {:severity :E}))
          :mode :n
          :desc "Show all workspace errors"}
         {1 :<leader>aw
          2 (fn []
              (vim.diagnostic.setqflist {:severity :W}))
          :mode :n
          :desc "Show all workspace warnings"}
         {1 :<leader>cl 2 vim.lsp.codelens.run :mode :n :desc "Apply codelens"}
         {1 :<leader>ca 2 vim.lsp.buf.code_action :mode :n :desc "Code action"}
         {1 :<leader>rn 2 vim.lsp.buf.rename :mode :n :desc :Rename}]}
 {1 :j-hui/fidget.nvim
  :event [:BufReadPre :BufNewFile]
  :dependencies [:neovim/nvim-lspconfig]
  :opts {:progress {:poll_rate 60}
         :notification {:poll_rate 60
                        :override_vim_notify true
                        :window {:max_width 120}}}}]

