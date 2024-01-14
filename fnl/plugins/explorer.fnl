[{1 :nvim-neo-tree/neo-tree.nvim
  :cmd :Neotree
  :keys [{1 :<leader>fn
          :mode [:n]
          2 "<CMD>Neotree toggle<CR>"
          :desc "Toggle filetree"}
         {1 :<leader>fG
          :mode [:n]
          2 "<CMD>Neotree source=git_status reveal=true toggle<CR>"
          :desc "Toggle git filetree"}
         {1 :<leader>fr
          :mode [:n]
          2 "<CMD>Neotree reveal=true toggle<CR>"
          :desc "Toggle filetree with current file revealed"}]
  :dependencies [:nvim-lua/plenary.nvim
                 :nvim-tree/nvim-web-devicons
                 :MunifTanjim/nui.nvim]
  :opts {:filesystem {:filtered_items {:hide_dotfiles false}}}}]

