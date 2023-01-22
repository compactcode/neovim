-- Searching in all windows (including the current one) on the tab page:
function leap_all_windows()
  local focusable_windows_on_tabpage = vim.tbl_filter(
    function (win) return vim.api.nvim_win_get_config(win).focusable end,
    vim.api.nvim_tabpage_list_wins(0)
  )

  require'leap'.leap {
    target_windows = focusable_windows_on_tabpage
  }
end

require("which-key").register({
  s = { leap_all_windows, "leap omni search" },
}, { mode = 'n' })
