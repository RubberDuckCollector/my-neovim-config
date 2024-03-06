-- Setup language servers.
local lspconfig = require('lspconfig')
lspconfig.pylsp.setup {}
lspconfig.tsserver.setup {}
lspconfig.lua_ls.setup {}
lspconfig.gopls.setup({})
lspconfig.ruby_ls.setup {}
lspconfig.rust_analyzer.setup {
  -- Server-specific settings. See `:help lspconfig-setup`
  settings = {
    ['rust-analyzer'] = {},
  },
}
