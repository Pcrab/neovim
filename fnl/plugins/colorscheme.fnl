[{1 :rose-pine/neovim
  :name :rose-pine
  :config (fn []
            (let [rose-pine (require :rose-pine)]
              (rose-pine.setup {:styles {:transparency true}})
              (vim.cmd "colorscheme rose-pine")))}]

