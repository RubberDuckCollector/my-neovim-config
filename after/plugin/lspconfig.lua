-- Setup language servers.
local lspconfig = require('lspconfig')
lspconfig.pylsp.setup({
  settings = {
    pylsp = {
      plugins = {
        flake8 = {
          extendIgnore = { "E501" }
        }
      }
    }
  }
})
-- lspconfig.ltex.setup {
--   settings = {
--     ltex = {
--       language = { "es", "en-GB" },
--     }
--   }
-- }
lspconfig.ocamllsp.setup {}
lspconfig.tsserver.setup {}
lspconfig.lua_ls.setup {}
lspconfig.gopls.setup {}
lspconfig.ruby_lsp.setup {}
lspconfig.rust_analyzer.setup {
  -- Server-specific settings. See `:help lspconfig-setup`
  settings = {
    ['rust-analyzer'] = {},
  },
}

return lspconfig
