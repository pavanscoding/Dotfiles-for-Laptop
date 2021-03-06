-- local gps=require("nvim-gps")
-- local status = require'nvim-spotify'.status
-- status:start()

require'lualine'.setup {
  options = {
    icons_enabled = true,
    theme = 'auto',
    section_separators = '', component_separators = '|',
    disabled_filetypes = {},
    always_divide_middle = true,
  },
  sections = {
    lualine_a = {'mode'},
    lualine_b = {'branch', 'diff',
                  {'diagnostics', sources={'coc'}}},
    -- lualine_c = {'filename'},
    -- lualine_c = {
    --     {'filename', status.listen},
	-- },
    -- lualine_c = {'filename',status.listen,cava_comp},
    lualine_x = {'encoding', 'fileformat', 'filetype'},
    lualine_y = {'progress'},
    lualine_z = {'location'}
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {'filename'},
    lualine_x = {'location'},
    lualine_y = {},
    lualine_z = {}
  },
  tabline = {},
  extensions = {'nvim-tree','fugitive'}
  -- extensions = {'nvim-tree'}
}
