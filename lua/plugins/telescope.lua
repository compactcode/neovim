local actions = require('telescope.actions')

require('telescope').setup {
  defaults = {
    mappings = {
      i = {
        ["<C-j>"] = actions.move_selection_next,
        ["<C-k>"] = actions.move_selection_previous,
      }
    },
    vimgrep_arguments = {
      'rg',
      '--color=never',
      '--no-heading',
      '--with-filename',
      '--line-number',
      '--column',
      '--smart-case'
    },
    layout_strategy = "horizontal",
    prompt_prefix = "> ",
    selection_caret = "> ",
    entry_prefix = "  ",
    initial_mode = "insert",
    sorting_strategy = "ascending",
    file_sorter =  require'telescope.sorters'.get_fzy_sorter,
    color_devicons = false,
    set_env = { ['COLORTERM'] = 'truecolor' }, -- default = nil,
    file_previewer = require'telescope.previewers'.vim_buffer_cat.new,
    grep_previewer = require'telescope.previewers'.vim_buffer_vimgrep.new,
    qflist_previewer = require'telescope.previewers'.vim_buffer_qflist.new,
  },
  pickers = {
    find_files = {
      find_command = { "fd", "--type", "f", "--strip-cwd-prefix" }
    },
  },
}

require("which-key").register({
  ["<leader>"] = {
    t = { "<cmd>Telescope find_files<cr>", "Open a file using fd" },
    d = { "<cmd>Telescope lsp_definitions<cr>", "lsp: Goto definition" },
    f = {
      name = "+file",
      f = { "<cmd>Telescope oldfiles<cr>", "Open a recently edited file" },
      g = { "<cmd>Telescope git_files<cr>", "Open a file using git ls-files" },
      s = { "<cmd>Telescope live_grep<cr>", "Search the project" },
      l = { "<cmd>Telescope resume<cr>", "Show the last search" },
      w = { "<cmd>Telescope grep_string<cr>", "Search the project for the current word" },
    },
    g = {
      name = "+git",
      h = { "<cmd>Telescope git_bcommits<cr>", "Show history for the current file" },
    },
    l = {
      name = "+lsp",
      a = { "<cmd>Telescope lsp_code_actions<cr>", "List code actions" },
      d = { "<cmd>Telescope lsp_definitions<cr>", "Goto definition" },
      l = { "<cmd>Telescope lsp_references<cr>", "Find references" },
    },
  },
})
