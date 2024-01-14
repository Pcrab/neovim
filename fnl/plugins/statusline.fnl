(fn file-info []
  (let [encoding ((. vim.opt.fileencoding :get))
        format vim.bo.fileformat]
    (string.format "%s,%s" encoding format)))

(fn lsp []
  (let [clients (vim.lsp.get_clients {:bufnr 0})
        names (vim.tbl_map (fn [client] client.name))]
    (table.concat names ",")))

(fn position []
  (let [(row col) (unpack (vim.api.nvim_win_get_cursor 0))
        lines (vim.api.nvim_buf_line_count (vim.api.nvim_win_get_buf 0))]
    (if (= row 1)
        (string.format "TOP/%d:%d" lines col)
        (= row lines)
        (string.format "BOT/%d:%d" lines col)
        (string.format "%3d/%d:%-3d" row lines col))))

(local block {1 "" :draw_empty true :separator {:left "█"}})

(local nvim-tree {:filetypes [:neo-tree]
                  :sections {:lualine_a [block]
                             :lualine_c [:filetype]
                             :lualine_z [block]}})

[{1 :nvim-lualine/lualine.nvim
  :dependencies [:nvim-tree/nvim-web-devicons]
  :opts {:options {:component_separators {:left "" :right ""}
                   :section_separators {:left "" :right ""}}
         :sections {:lualine_a [:mode]
                    :lualine_b [{1 :branch :draw_empty true}
                                :diff
                                :diagnostics]
                    :lualine_c [{1 :filename
                                 :path 1
                                 :symbols {:modified "*" :readonly ""}}]
                    :lualine_x [:filetype [1 file-info :icon "󰋽"]]
                    :lualine_y [{1 lsp :icon ""}]
                    :lualine_z [{1 position :icon "󰆤"}]}
         :inactive_section {:lualine_a [block]
                            :lualine_b []
                            :lualine_c [{1 :filename
                                         :path 1
                                         :symbols {:modified "*"
                                                   :readonly ""}}]
                            :lualine_x [{1 file-info :icon "󰋽"}]
                            :lualine_y []
                            :lualine_z [block]}
         :extensions [nvim-tree]}}]

