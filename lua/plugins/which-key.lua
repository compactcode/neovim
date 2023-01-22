require("which-key").setup {
  plugins = {
    marks = true, -- shows a list of your marks on ' and `
    registers = true, -- shows your registers on " in NORMAL or <C-r> in INSERT mode
    spelling = {
      enabled = false, -- enabling this will show WhichKey when pressing z= to select spelling suggestions
    },
    presets = {
      operators = true, -- adds help for operators like d, y, ... and registers them for motion / text object completion
      motions = true, -- adds help for motions
      text_objects = true, -- help for text objects triggered after entering an operator
      windows = false, -- default bindings on <c-w>
      nav = false, -- misc bindings to work with windows
      z = false, -- bindings for folds, spelling and others prefixed with z
      g = false, -- bindings for prefixed with g
    },
  },
  window = {
    border = "single", -- none, single, double, shadow
  },
  triggers = "auto", -- automatically setup triggers
}

require("which-key").register({
  ["<C-h>"] = {"<cmd>wincmd h<cr>", "Move window left"},
  ["<C-j>"] = {"<cmd>wincmd j<cr>", "Move window right"},
  ["<C-k>"] = {"<cmd>wincmd k<cr>", "Move window up"},
  ["<C-l>"] = {"<cmd>wincmd l<cr>", "Move window down"},
  Y = {"y$", "Copy to end of line"},
  Q = {"<cmd>wa<cr>ZZ", "Save all and exit"},
  ["<leader>"] = {
    q = { "<cmd>cnext<cr>", "Go to the next quickfix item" },
    f = {
      name = "+file",
      c = { "<cmd>let @+ = expand('%')<cr>", "Copy the current path to clipboard" },
    },
    [","] = { "<cmd>nohlsearch<cr>", "Clear the current search" },
  },
}, { mode = 'n' })

require("which-key").register({
  ["kj"] = { "<esc><cmd>update<cr>", "Quickly exit insert mode and save"},
}, { mode = 'i' })

require("which-key").register({
  ["<leader>"] = {
    c = { "\"+y", "Copy to clipboard" },
  },
}, { mode = 'v' })

vim.api.nvim_set_keymap('t', '<C-n>', '<C-\\><C-n>', {noremap = true})
