-- Setup language servers.
local lspconfig = require('lspconfig')
-- lspconfig.pylsp.setup({
--   settings = {
--     pylsp = {
--       plugins = {
--         flake8 = {
--           extendIgnore = { "E501" }
--         }
--       }
--     }
--   }
-- })
-- lspconfig.ltex.setup {
--   settings = {
--     ltex = {
--       language = { "es", "en-GB" },
--     }
--   }
-- }
lspconfig.pyright.setup {}
lspconfig.ocamllsp.setup {}
lspconfig.clangd.setup {}
lspconfig.omnisharp.setup {}
lspconfig.bashls.setup {}
lspconfig.ts_ls.setup {}
lspconfig.clojure_lsp.setup {}
lspconfig.lua_ls.setup {}
lspconfig.gopls.setup {}
lspconfig.solargraph.setup {}
lspconfig.zls.setup {}
lspconfig.gleam.setup {}
lspconfig.texlab.setup {}
lspconfig.rust_analyzer.setup {
  -- Server-specific settings. See `:help lspconfig-setup`
  settings = {
    ['rust-analyzer'] = {},
  },
}

return lspconfig
