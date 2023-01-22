require('lualine').setup {
  options = {
    icons_enabled = true,
    component_separators = {'|', '|'},
  },
  sections = {
    lualine_a = {'mode'},
    lualine_b = {'branch'},
    lualine_c = {{'filename', file_status = true, path = 1}},
    lualine_x = {'encoding', 'fileformat', {'filetype', colored = false}},
    lualine_y = {'progress'},
    lualine_z = {'location'},
  },
}
