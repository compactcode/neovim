return require("packer").startup(function(use)
  use {
    "wbthomason/packer.nvim",
  }

  use {
    "windwp/nvim-autopairs",
    config = function()
      require("nvim-autopairs").setup()
    end
  }

  use {
    "folke/which-key.nvim",
    config = function()
      require("plugins.which-key")
    end
  }

  use {
    "shaunsingh/nord.nvim",
    config = function()
      require("plugins.nord")
    end
  }

  use {
    "nvim-neotest/neotest",
    requires = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
      "olimorris/neotest-rspec",
      "nvim-neotest/neotest-plenary",
    },
    config = function()
      require("plugins.neotest")
    end
  }

  -- toggle single-> multiline styles of code
  use {
    'Wansmer/treesj',
    requires = {
      "nvim-treesitter/nvim-treesitter",
      "folke/which-key.nvim",
    },
    config = function()
      require('plugins.treesj')
    end,
  }

  use {
    "lukas-reineke/indent-blankline.nvim",
    config = function()
      require("plugins.indent-blankline")
    end
  }

  use {
    "neovim/nvim-lspconfig",
    requires = {
      "folke/neodev.nvim",
      "folke/which-key.nvim",
    },
    config = function()
      require("plugins.lspconfig")
    end
  }

  use {
    "jose-elias-alvarez/null-ls.nvim",
    config = function()
      require("plugins.null-ls")
    end
  }

  use {
    "nvim-treesitter/nvim-treesitter",
    requires = {
      { "nvim-treesitter/nvim-treesitter-textobjects" },
      { "nvim-treesitter/nvim-treesitter-refactor" },
      { "folke/which-key.nvim" },
    },
    config = function()
      require("plugins.treesitter")
    end
  }

  use {
    "hoob3rt/lualine.nvim",
    requires = {
      { "shaunsingh/nord.nvim" },
      { "nvim-tree/nvim-web-devicons" }
    },
    after = "nord.nvim",
    config = function()
      require("plugins.lualine")
    end
  }

  use {
    "kyazdani42/nvim-tree.lua",
    requires = {
      { "folke/which-key.nvim" },
      { "nvim-tree/nvim-web-devicons" }
    },
    config = function()
      require("plugins.nvim-tree")
    end
  }

  use {
    "hrsh7th/vim-vsnip",
    requires = {
      "rafamadriz/friendly-snippets",
    },
  }

  use {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    event = "InsertEnter",
    config = function()
      require("plugins.copilot")
    end,
  }

  use {
    "zbirenbaum/copilot-cmp",
    after = { "copilot.lua" },
    config = function ()
      require("plugins.copilot-cmp")
    end
  }

  use {
    "hrsh7th/nvim-cmp",
    requires = {
      { "hrsh7th/cmp-nvim-lsp" },
      { "hrsh7th/cmp-buffer" },
      { "hrsh7th/cmp-path" },
      { "hrsh7th/cmp-cmdline" },
      { "hrsh7th/cmp-vsnip" },
      { "hrsh7th/vim-vsnip" },
      { "zbirenbaum/copilot-cmp" },
      { "onsails/lspkind-nvim" },
    },
    config = function()
      require("plugins.cmp")
    end
  }

  use {
    "nvim-telescope/telescope.nvim",
    requires = {
      { "nvim-lua/plenary.nvim" },
      { "folke/which-key.nvim" },
      { "nvim-tree/nvim-web-devicons" }
    },
    config = function()
      require("plugins.telescope")
    end
  }

  use {
    "numToStr/Comment.nvim",
    requires = {
      { "folke/which-key.nvim" },
    },
    config = function()
      require("plugins.comment-nvim")
    end
  }

  use {
    "lewis6991/gitsigns.nvim",
    requires = {
      { "nvim-lua/plenary.nvim" },
      { "folke/which-key.nvim" },
    },
    config = function()
      require("plugins.gitsigns")
    end
  }

  use {
    "norcalli/nvim-colorizer.lua",
    config = function()
      require("plugins.nvim-colorizer")
    end
  }

  use {
    "ggandor/leap.nvim",
    requires = {
      { "folke/which-key.nvim" },
    },
    config = function()
      require("plugins.leap")
    end
  }

  use {
    "tpope/vim-projectionist",
    config = function()
      require("plugins.projectionist")
    end
  }

  use { "stevearc/dressing.nvim" }
  use { "kevinhwang91/nvim-bqf" }
  use { "slim-template/vim-slim", }
  use { "tpope/vim-repeat", }
  use { "tpope/vim-surround", }
end)
