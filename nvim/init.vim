source $HOME/.config/nvim/bin/Plugins/plugins.vim
lua require('impatient')
source $HOME/.config/nvim/bin/Settings/settings.vim
source $HOME/.config/nvim/bin/Code-run/run.vim
source $HOME/.config/nvim/bin/Coc-nvim/coc.vim
source $HOME/.config/nvim/bin/Latex/latex.vim
luafile $HOME/.config/nvim/bin/Barbar/barbar.lua
luafile $HOME/.config/nvim/bin/Lualine/gps.lua
luafile $HOME/.config/nvim/bin/Lualine/lualine.lua
source $HOME/.config/nvim/bin/NvimTree/tree.vim
luafile $HOME/.config/nvim/bin/NvimTree/tree.lua
source $HOME/.config/nvim/bin/Telescope/telescope.vim
luafile $HOME/.config/nvim/bin/Telescope/telescope.lua
source $HOME/.config/nvim/bin/Dashboard/dashboard.vim
source $HOME/.config/nvim/bin/Texgroff/texgroff.vim
source $HOME/.config/nvim/bin/Sidebar/sidebar.vim
luafile $HOME/.config/nvim/bin/Git/octo.lua
luafile $HOME/.config/nvim/bin/Git/gitsigns.lua
source $HOME/.config/nvim/bin/Git/lazygit.vim
luafile $HOME/.config/nvim/bin/Notify/notify.lua

" better escape
let g:better_escape_interval = 200
let g:better_escape_shortcut = 'fd'

" filetype.nvim
lua vim.g.did_load_filetypes = 1

" Tree sitter
lua << END
require'nvim-treesitter.configs'.setup {
  autotag = {
    enable = true,
  }
}
END

" Cp helper
let g:cpp_compile_command='g++ -std=c++17 -Wshadow -Wall -O2 -Wno-unused-result solution.cpp -o cpp.out'

" Colorizer
lua require'colorizer'.setup()

" i3config highlighting
aug i3config_ft_detection
  au!
  au BufNewFile,BufRead ~/.config/i3/config set filetype=i3config
aug end
