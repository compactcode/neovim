require("neodev").setup {}

local lsp = require('lspconfig')

lsp.rust_analyzer.setup {}
lsp.solargraph.setup {}
lsp.sumneko_lua.setup {}

require("which-key").register({
  ["<leader>"] = {
    h = { "<cmd>lua vim.lsp.buf.hover()<cr>", "+lsp: Show hover" },
    l = {
      name = "+lsp",
      r = { "<cmd>lua vim.lsp.buf.rename()<cr>", "Rename" },
      h = { "<cmd>lua vim.lsp.buf.hover()<cr>", "Show hover" },
      s = { "<cmd>lua vim.lsp.buf.signature_help()<cr>", "Show signature" },
    },
  },
})
