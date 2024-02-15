(vim.keymap.set :n :<leader>p "\"+P"
                {:noremap true :desc "Paste without replace clipboard"})

(fn toggle-quickfix []
  (let [wins (vim.fn.getwininfo)
        filter :filter
        totable :totable
        qf-win (: (: (vim.iter wins) filter (fn [win] (= win.quickfix 1)))
                  totable)]
    (if (= (length qf-win) 0)
        (vim.cmd.cclose)
        (vim.cmd.copen))))

(vim.keymap.set :n :<leader>q toggle-quickfix {:desc "Toggle quickfix"})

(local filetype-keymaps (vim.api.nvim_create_augroup :qf_filetype_keymaps {}))

(vim.api.nvim_create_autocmd :Filetype
                             {:group filetype-keymaps
                              :pattern :qf
                              :callback (fn [args]
                                          (let [bufnr args.buf]
                                            (vim.keymap.set :n :q
                                                            :<CMD>cclose<CR>
                                                            {:buffer bufnr})))})

(vim.keymap.set :n :gf :<C-w>f {:desc "Open file under cursor in split"})
(vim.keymap.set :v :gf :<C-w>f {:desc "Open file under cursor in split"})

