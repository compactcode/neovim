require('gitsigns').setup({
  keymaps = {},
  current_line_blame = true,
  current_line_blame_opts = {
    delay = 500,
  },
  preview_config = {
    border = 'none',
  },
  yadm = {
    enable = true,
  },
})

require("which-key").register({
  ["<leader>"] = {
    g = {
      name = "+git",
      n = { "<cmd>Gitsigns next_hunk<cr>", "Show changes for the next hunk" },
      p = { "<cmd>Gitsigns preview_hunk<cr>", "Show changes for this hunk" },
      r = { "<cmd>Gitsigns reset_hunk<cr>", "Discard this hunk" },
    },
  },
})
