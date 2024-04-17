-- Setup language servers.
local lspconfig = require("lspconfig")
lspconfig.tsserver.setup({})
lspconfig.lua_ls.setup({
  settings = {
    Lua = {
      diagnostics = {
        globals = { "vim" },
      }
    }
  }
})
