vim.o.completeopt = "menu,menuone,noselect"

local cmp = require('cmp')

local has_words_before = function()
  local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

local feedkey = function(key, mode)
  vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes(key, true, true, true), mode, true)
end

cmp.setup({
  mapping = {
    ["<Tab>"] = cmp.mapping(
      function(fallback)
        if cmp.visible() then
          cmp.select_next_item()
        elseif vim.fn["vsnip#available"](1) == 1 then
          feedkey("<Plug>(vsnip-expand-or-jump)", "")
        elseif has_words_before() then
          cmp.complete()
        else
          fallback() -- The fallback function sends a already mapped key. In this case, it's probably `<Tab>`.
        end
      end,
      { "i", "s" }
    ),

    ["<S-Tab>"] = cmp.mapping(
      function()
        if cmp.visible() then
          cmp.select_prev_item()
        elseif vim.fn["vsnip#jumpable"](-1) == 1 then
          feedkey("<Plug>(vsnip-jump-prev)", "")
        end
      end,
      { "i", "s" }
    ),

    ['<CR>'] = cmp.mapping.confirm({ select = true }),
  },
  snippet = {
    expand = function(args)
      vim.fn["vsnip#anonymous"](args.body)
    end,
  },
  formatting = {
    format = require('lspkind').cmp_format(),
  },
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
    { name = 'vsnip' },
    {
      name = 'buffer',
      option = {
        get_bufnrs = function()
          -- Use all open buffers.
          return vim.api.nvim_list_bufs()
        end
      },
    },
    { name = 'path' },
  })
})

-- Use buffer source for `/`
cmp.setup.cmdline('/', {
  sources = {
    { name = 'buffer' },
  }
})

-- Use cmdline & path source for ':'.
cmp.setup.cmdline(':', {
  sources = cmp.config.sources({
    { name = 'path' },
    { name = 'cmdline' },
  })
})
