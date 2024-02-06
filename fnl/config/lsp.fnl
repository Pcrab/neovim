((. (require :mason) :setup))
((. (require :mason-lspconfig) :setup))
((. (require :mason-tool-installer) :setup) {:ensure_installed [:lua_ls
                                                                :fennel_language_server
                                                                :jsonls
                                                                :yamlls
                                                                :stylua]})

(local capabilities ((. (require :cmp_nvim_lsp) :default_capabilities)))
(set capabilities.textDocument.foldingRange
     {:dynamicRegistration false :lineFoldingOnly true})

(local lspconfig (require :lspconfig))
(fn setup [server-name config]
  ((. (. lspconfig server-name) :setup) config))

(setup :lua_ls
       {: capabilities
        :settings {:Lua {:format {:enable true}
                         :runtime {:version :LuaJIT}
                         :diagnostics {:globals [:vim]}}}})

(setup :fennel_language_server
       {: capabilities :settings {:fennel {:diagnostics {:globals [:vim]}}}})

(setup :jsonls {: capabilities
                :settings {:json {:schemas ((. (. (require :schemastore) :json)
                                               :schemas))
                                  :validate {:enable true}}}})

(setup :yamlls {: capabilities
                :settings {:yaml {:schemaStore {:enable false :url ""}
                                  :schemas ((. (. (require :schemastore) :yaml)
                                               :schemas))}}})

(setup :ocamllsp {: capabilities})

