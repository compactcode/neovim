require('treesj').setup({
  use_default_keymaps = false,
})

require("which-key").register({
  ["<leader>"] = {
    s = {
      name = "+treesitter",
      j = { "<cmd>TSJToggle<cr>", "Toggle single->multiline for current node" },
    },
  },
})
