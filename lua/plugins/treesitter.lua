require("nvim-treesitter.configs").setup {
  ensure_installed = {
    "bash",
    "css",
    "html",
    "javascript",
    "json",
    "lua",
    "markdown",
    "ruby",
    "rust",
    "scss",
    "typescript",
    "yaml",
  },

  highlight = {
    enable = true,
    custom_captures = {
      ["symbol"] = "TSVariable",
    },
  },

  incremental_selection = {
    enable = true,
    keymaps = {
      node_incremental = "J",
      node_decremental = "K",
    },
  },

  indent = {
    enable = false
  },

  textobjects = {
    lsp_interop = {
      enable = true,
      border = "none",
      peek_definition_code = {
        ["<leader>p"] = "@function.outer",
      },
    },

    move = {
      enable = true,
      goto_next_start = {
        ["[b"] = "@block.outer",
        ["[c"] = "@class.outer",
        ["[f"] = "@function.outer",
      },
      goto_previous_start = {
        ["]b"] = "@block.outer",
        ["]c"] = "@class.outer",
        ["]f"] = "@function.outer",
      },
    },

    select = {
      enable = true,
      lookahead = true,
      keymaps = {
        ["af"] = "@function.outer",
        ["if"] = "@function.inner",
        ["ab"] = "@block.outer",
        ["ib"] = "@block.inner",
        ["ac"] = "@class.outer",
        ["ic"] = "@class.inner",
      },
    },

    swap = {
      enable = true,
      swap_next = {
        ["<leader>sj"] = "@parameter.inner",
      },
      swap_previous = {
        ["<leader>sk"] = "@parameter.inner",
      },
    },
  },

  refactor = {
    highlight_definitions = {
      enable = true
    },
    smart_rename = {
      enable = true,
      keymaps = {
        smart_rename = "gr",
      },
    },
  },
}

require("which-key").register({
  ["<leader>"] = {
    p = { "+lsp: Peek definition" },
    s = {
      name = "+treesitter",
      j = { "Swap paremeter -> right" },
      k = { "Swap paremeter -> left" },
    },
    l = {
      name = "+lsp",
      p = { "Peek definition" },
    },
  },
  ["]"] = {
    b = { "Goto next block" },
    f = { "Goto next function" },
  },
  g = {
    r = { "Rename" },
  },
}, { mode = "n" })

require("which-key").register({
  K = { "Expand current selection" },
  J = { "Shrink current selection" },
}, { mode = "v" })
