local null_ls = require("null-ls")

null_ls.setup({
  sources = {
    null_ls.builtins.code_actions.gitsigns,
    null_ls.builtins.formatting.jq,
    null_ls.builtins.formatting.nixfmt,
    null_ls.builtins.hover.printenv,
  },
})
