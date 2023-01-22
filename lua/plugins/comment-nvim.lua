require('Comment').setup({
  mappings = {
    basic = true,
    extra = false,
    extended = false,
  },
})

require("which-key").register({
  g = {
    b = { "Block comment" },
    c = { "Line comment" },
  },
}, { mode = "n" })
