local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end

vim.opt.rtp:prepend(lazypath)

local plugins = {
  {
    "shaunsingh/nord.nvim",
    priority = 1000,
    config = function()
      vim.g.nord_contrast = true
      vim.g.nord_borders = true

      require('nord').set()
    end
  },

  {
    "nvim-telescope/telescope.nvim",
    command = "Telescope",
    dependencies = {
      { "nvim-lua/plenary.nvim" },
      { "nvim-tree/nvim-web-devicons" }
    },
    config = function()
      local actions = require('telescope.actions')

      require('telescope').setup {
        defaults = {
          color_devicons = false,
          mappings = {
            i = {
              ["<C-j>"] = actions.move_selection_next,
              ["<C-k>"] = actions.move_selection_previous,
            }
          },
          sorting_strategy = "ascending",
        }
      }
    end,
    keys = {
      { "<leader>t", "<cmd>Telescope find_files<cr>", desc = "Open a file using fd" },
      { "<leader>d", "<cmd>Telescope lsp_definitions<cr>", desc = "lsp: Goto definition" },
      { "<leader>ff", "<cmd>Telescope oldfiles<cr>", desc = "Open a recently edited file" },
      { "<leader>fg", "<cmd>Telescope git_files<cr>", desc = "Open a file using git ls-files" },
      { "<leader>fs", "<cmd>Telescope live_grep<cr>", desc = "Search the project" },
      { "<leader>fl", "<cmd>Telescope resume<cr>", desc = "Show the last search" },
      { "<leader>fw", "<cmd>Telescope grep_string<cr>", desc = "Search the project for the current word" },
      { "<leader>gh", "<cmd>Telescope git_bcommits<cr>", desc = "Show history for the current file" },
      { "<leader>ld", "<cmd>Telescope lsp_definitions<cr>", desc = "Goto definition" },
      { "<leader>ll", "<cmd>Telescope lsp_references<cr>", desc = "Find references" },
    }
  },

  {
    "folke/which-key.nvim",
    config = function(_, opts)
      local wk = require("which-key")
      wk.setup(opts)
      local groups = {
        mode = { "n"},
        ["<leader>f"] = { name = "+file" }
      }
      wk.register(groups)
    end,
    opts = {
      plugins = {
        spelling = {
          enabled = false,
        }
      },
      window = {
        border = "single",
      }
    }
  }
}

require("lazy").setup(plugins)
