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
  -- indentation decorations
  {
    "lukas-reineke/indent-blankline.nvim",
    event = { "BufReadPost", "BufNewFile" },
    main = "ibl",
    opts = {
      scope = {
        enabled = true,
        show_start = false,
        show_end = false,
      },
      exclude = {
        filetypes = {
          "help",
          "neo-tree",
          "lazy",
        },
      },
    },
  },

  -- status line
  {
    "hoob3rt/lualine.nvim",
    dependencies = {
      { "shaunsingh/nord.nvim" },
      { "nvim-tree/nvim-web-devicons" },
    },
    opts = {
      options = {
        icons_enabled = true,
        component_separators = { '|', '|' },
      },
      sections = {
        lualine_a = { 'mode' },
        lualine_b = { 'branch' },
        lualine_c = { { 'filename', file_status = true, path = 1 } },
        lualine_x = { 'encoding', 'fileformat', { 'filetype', colored = false } },
        lualine_y = { 'progress' },
        lualine_z = { 'location' },
      },
    },
  },

  -- git decorations
  {
    "lewis6991/gitsigns.nvim",
    event = { "BufReadPre", "BufNewFile" },
    opts = {
      current_line_blame = true,
      preview_config = {
        border = 'none',
      },
    },
  },

  -- ui improvements
  {
    'stevearc/dressing.nvim',
  },

  -- colorscheme
  {
    "shaunsingh/nord.nvim",
    priority = 1000,
    config = function()
      vim.g.nord_contrast = true
      vim.g.nord_borders = true

      require('nord').set()
    end,
  },

  -- align text
  {
    "echasnovski/mini.align",
    version = false,
    config = function()
      require("mini.align").setup()
    end
  },

  -- comment toggling
  {
    "echasnovski/mini.comment",
    version = false,
    config = function()
      require("mini.comment").setup()
    end
  },

  -- automatic pair insertion
  {
    "echasnovski/mini.pairs",
    version = false,
    config = function()
      require("mini.pairs").setup()
    end
  },

  -- surround actions
  {
    "echasnovski/mini.surround",
    version = false,
    config = function()
      require("mini.surround").setup()
    end
  },

  -- finder, picker & sorter
  {
    "nvim-telescope/telescope.nvim",
    command = "Telescope",
    dependencies = {
      { "nvim-lua/plenary.nvim" },
      { "nvim-tree/nvim-web-devicons" },
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
    },
  },

  -- buffer search
  {
    "folke/flash.nvim",
    event = "VeryLazy",
    keys = {
      { "f", mode = { "n", "o", "x" }, function() require("flash").jump() end, desc = "Flash" },
      { "S", mode = { "n", "o", "x" }, function() require("flash").treesitter() end, desc = "Flash Treesitter" },
      { "R", mode = { "o", "x" }, function() require("flash").treesitter_search() end, desc = "Flash Treesitter Search" },
    },
  },

  -- file browser
  {
    "nvim-tree/nvim-tree.lua",
    dependencies = {
      { "nvim-tree/nvim-web-devicons" },
    },
    opts = {
      renderer = {
        icons = {
          webdev_colors = false,
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
    },
    keys = {
      { "<leader>fb", "<cmd>NvimTreeToggle<cr>", desc = "Browse files" },
      { "<leader>fo", "<cmd>NvimTreeFindFile<cr>", desc = "Browse path of the current file" },
    },
  },

  -- search/replace in multiple files
  {
    "nvim-pack/nvim-spectre",
    build = false,
    cmd = "Spectre",
    opts = { open_cmd = "noswapfile vnew" },
    keys = {
      { "<leader>s", function() require("spectre").open() end, desc = "Replace in files (Spectre)" },
    },
  },

  -- syntax parsing
  {
    "nvim-treesitter/nvim-treesitter",
    dependencies = {
      { "nvim-treesitter/nvim-treesitter-textobjects" },
    },
    event = { "BufReadPost", "BufNewFile" },
    config = function(_, opts)
      require("nvim-treesitter.configs").setup(opts)
    end,
    opts = {
      ensure_installed = {
        "bash",
        "css",
        "html",
        "javascript",
        "json",
        "lua",
        "markdown",
        "nix",
        "python",
        "ruby",
        "rust",
        "scss",
        "terraform",
        "typescript",
        "vimdoc",
        "yaml",
      },

      highlight = {
        enable = true,
        custom_captures = {
          ["symbol"] = "TSVariable",
        },
      },

      indent = {
        enable = true
      },

      textobjects = {
        lsp_interop = {
          enable = true,
          border = "none",
          peek_definition_code = {
            ["<leader>p"] = "@function.outer",
          },
        },
      },
    },
  },

  -- syntax parsing
  {
    "slim-template/vim-slim",
    ft = { "slim" },
  },

  -- auto completion
  {
    "hrsh7th/nvim-cmp",
    version = false,
    event = "InsertEnter",
    dependencies = {
      { "hrsh7th/cmp-buffer" },
      { "hrsh7th/cmp-nvim-lsp" },
      { "hrsh7th/cmp-path" },
      { "onsails/lspkind-nvim" },
      { "saadparwaiz1/cmp_luasnip" },
      { "zbirenbaum/copilot-cmp" },
    },
    opts = function()
      local cmp = require("cmp")
      local defaults = require("cmp.config.default")()
      return {
        completion = {
          completeopt = "menu,menuone,noinsert",
        },
        formatting = {
          format = require("lspkind").cmp_format({
            mode = "symbol",
            max_width = 50,
            symbol_map = { Copilot = "" }
          }),
        },
        mapping = cmp.mapping.preset.insert({
          ["<C-n>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
          ["<C-p>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
          ["<C-Space>"] = cmp.mapping.complete(),
          ["<C-e>"] = cmp.mapping.abort(),
          ["<CR>"] = cmp.mapping.confirm({ select = true }),
        }),
        snippet = {
          expand = function(args)
            require("luasnip").lsp_expand(args.body)
          end,
        },
        sources = cmp.config.sources({
          { name = "copilot" },
          { name = "nvim_lsp" },
          { name = "luasnip" },
          { name = "buffer" },
          { name = "path" },
        }),
        sorting = defaults.sorting,
      }
    end,
  },

  -- auto completion
  {
    "zbirenbaum/copilot-cmp",
    config = function()
      require("copilot_cmp").setup()
    end
  },

  -- auto completion
  {
    "zbirenbaum/copilot.lua",
    command = "Copilot",
    event = { "InsertEnter" },
    opts = {
      panel = {
        enabled = false,
      },
      suggestion = {
        enabled = false,
      },
      filetypes = {
        gitcommit = false,
        gitrebase = false,
      },
    },
  },

  -- snippets
  {
    "l3mon4d3/LuaSnip",
    dependencies = {
      "rafamadriz/friendly-snippets",
      config = function()
        require("luasnip.loaders.from_vscode").lazy_load()
      end,
    },
    version = "2.*",
    keys = {
      {
        "<tab>",
        function()
          return require("luasnip").jumpable(1) and "<Plug>luasnip-jump-next" or "<tab>"
        end,
        expr = true, silent = true, mode = "i",
      },
      { "<tab>", function() require("luasnip").jump(1) end, mode = "s" },
      { "<s-tab>", function() require("luasnip").jump(-1) end, mode = { "i", "s" } },
    },
  },

  -- lsp
  {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      { "folke/neodev.nvim", opts = {} },
    },
    config = function()
      local capabilities = require('cmp_nvim_lsp').default_capabilities()

      local lsp = require('lspconfig')

      lsp.ruby_ls.setup {
        capabilities = capabilities,
      }
      lsp.lua_ls.setup {
        capabilities = capabilities,
      }
    end,
    keys = {
      { "<leader>a", "<cmd>lua vim.lsp.buf.code_action()<cr>", desc = "List code actions" },
      { "<leader>la", "<cmd>lua vim.lsp.buf.code_action()<cr>", desc = "List code actions" },
      { "<leader>lf", "<cmd>lua vim.lsp.buf.format()<cr>", desc = "Format file" },
      { "<leader>lr", "<cmd>lua vim.lsp.buf.rename()<cr>", desc = "Rename" },
      { "<leader>ls", "<cmd>lua vim.lsp.buf.signature_help()<cr>", desc = "Show signature" },
    },
  },

  -- lsp integrations
  {
    "nvimtools/none-ls.nvim",
    dependencies = {
      { "nvim-lua/plenary.nvim" },
      { "ckolkey/ts-node-action" },
    },
    config = function()
      local null_ls = require("null-ls")

      local sources = {
        null_ls.builtins.code_actions.ts_node_action,
      }

      null_ls.setup({ sources = sources })
    end,
  },

  -- refactoring actions
  {
    "ckolkey/ts-node-action",
    dependencies = {
      { "nvim-treesitter" },
    },
    opts = {},
  },

  -- test runner
  {
    "nvim-neotest/neotest",
    dependencies = {
      { "olimorris/neotest-rspec" },
      { "nvim-lua/plenary.nvim" },
      { "nvim-treesitter/nvim-treesitter" },
    },
    keys = {
      name = "+test",
      { "<leader>rl", "<cmd>lua require('neotest').run.run()<cr>", desc = "Run nearest to line" },
      { "<leader>ro", "<cmd>lua require('neotest').output.open()<cr>", desc = "Display output" },
      { "<leader>rr", "<cmd>lua require('neotest').run.run(vim.fn.expand('%'))<cr>", desc = "Run entire file" },
      { "<leader>rs", "<cmd>lua require('neotest').summary.toggle()<cr>", desc = "Display summary" },
      { "!", "<cmd>lua require('neotest').run.run_last()<cr>", desc = "Re-run last test" },
    },
    opts = {
      adapters = {
        require("neotest-plenary"),
        require("neotest-rspec"),
      },
      quickfix = {
        enabled = false,
      },
    },
  },

  -- keybinding ui
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    config = function(_, opts) local wk = require("which-key")
      wk.setup(opts)
      local groups = {
        mode = { "n" },
        ["<leader>f"] = { name = "+file" },
        ["<leader>l"] = { name = "+lsp" },
        ["<leader>r"] = { name = "+test" },
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
    },
  }
}

require("lazy").setup(plugins)
