(local {: autoload} (require :nfnl.module))
(local nvim (autoload :nvim))
(local core (autoload :nfnl.core))

;space is reserved to be lead
(nvim.set_keymap :n :<space> :<nop> {:noremap true})

;sets a nvim global options
(let [options {:expandtab true
               :tabstop 4
               :shiftwidth 4
               :softtabstop 4
               ;settings needed for compe autocompletion
               :completeopt "menuone,noselect"
               :ignorecase true
               :smartcase true
               :clipboard :unnamedplus
               :number true
               :relativenumber true
               :ruler true
               :signcolumn :yes
               :colorcolumn :120
               :cursorline true
               :cursorcolumn true
               :scrolloff 10}]
  (each [option value (pairs options)]
    (core.assoc nvim.o option value)))

(if (= (vim.fn.has :wsl) 1)
    (set vim.g.clipboard {
                          :name :WslClipboard
                          :copy {:+ :clip.exe
                                 :* :clip.exe}
                          :paste {:+ "powershell.exe -c [Console]::Out.Write($(Get-Clipboard -Raw).tostring().replace(\"`r\", \"\"))"
                                  :* "powershell.exe -c [Console]::Out.Write($(Get-Clipboard -Raw).tostring().replace(\"`r\", \"\"))"}
                          :cache_enabled 0}))
    


(require :config.keymaps)

{}

