(fn ts [name]
  (.. "<CMD>Telescope " name :<CR>))

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
  :keys [{1 :gd 2 (ts :lsp_definitions) :mode :n :desc "Goto definition"}
         {1 :gD
          2 (ts :lsp_type_definitions)
          :mode :n
          :desc "Goto type definition"}
         {1 :gi
          2 (ts :lsp_implementations)
          :mode :n
          :desc "Goto implementation"}
         {1 :K 2 vim.lsp.buf.hover :mode :n :desc "Display hover information"}
         {1 :gh
          2 vim.lsp.buf.signature_help
          :mode :n
          :desc "Display hover information"}
         {1 :gr 2 (ts :lsp_references) :mode :n :desc "List references"}
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
          2 (ts :diagnostics)
          :mode :n
          :desc "Show all workspace diagnostics"}
         {1 :<leader>D
          2 vim.diagnostic.open_float
          :mode :n
          :desc "Open diagnostic message of current line"}
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

