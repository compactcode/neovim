require("which-key").register({
  ["<leader>"] = {
    a = { "<cmd>:AV<cr>", "Open alternate in split" },
  },
  g = {
    a = { "<cmd>:A<cr>", "Goto alternate file" },
  },
}, { mode = "n" })
