require("nvim-tree").setup {
  renderer = {
    icons = {
      show = {
        file = true,
        folder = true,
        folder_arrow = true,
        git = false,
      },
    },
  },
  view = {
    adaptive_size = true,
  },
}

require("which-key").register({
  ["<leader>"] = {
    f = {
      name = "+file",
      b = { "<cmd>NvimTreeToggle<cr>", "Browse files" },
      o = { "<cmd>NvimTreeFindFile<cr>", "Browse path of the current file" },
    },
  },
})
