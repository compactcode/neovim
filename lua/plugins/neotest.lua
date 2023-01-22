require("neotest").setup({
  adapters = {
    require("neotest-plenary"),
    require("neotest-rspec"),
  },
})

require("which-key").register({
  ["<leader>"] = {
    r = {
      name = "+test",
      l = { "<cmd>lua require('neotest').run.run()<cr>", "Run nearest to line" },
      o = { "<cmd>lua require('neotest').output.open()<cr>", "Display output" },
      r = { "<cmd>lua require('neotest').run.run(vim.fn.expand('%'))<cr>", "Run entire file" },
      s = { "<cmd>lua require('neotest').summary.toggle()<cr>", "Display summary" }
    },
  },
  ["!"] = { "<cmd>lua require('neotest').run.run_last()<cr>", "Re-run last test" },
})
