-- [nfnl] Compiled from fnl/config/lsp.fnl by https://github.com/Olical/nfnl, do not edit.
do end (require("mason")).setup()
do end (require("mason-lspconfig")).setup()
do end (require("mason-tool-installer")).setup({ensure_installed = {"lua_ls", "fennel_language_server", "jsonls", "yamlls", "stylua"}})
local capabilities = (require("cmp_nvim_lsp")).default_capabilities()
capabilities.textDocument.foldingRange = {lineFoldingOnly = true, dynamicRegistration = false}
local lspconfig = require("lspconfig")
local function setup(server_name, config)
  return lspconfig[server_name].setup(config)
end
setup("lua_ls", {capabilities = capabilities, settings = {Lua = {format = {enable = true}, runtime = {version = "LuaJIT"}, diagnostics = {globals = {"vim"}}}}})
setup("fennel_language_server", {capabilities = capabilities, settings = {fennel = {diagnostics = {globals = {"vim"}}}}})
setup("jsonls", {capabilities = capabilities, settings = {json = {schemas = ((require("schemastore")).json).schemas(), validate = {enable = true}}}})
setup("yamlls", {capabilities = capabilities, settings = {yaml = {schemaStore = {url = "", enable = false}, schemas = ((require("schemastore")).yaml).schemas()}}})
return setup("ocamllsp", {capabilities = capabilities})
