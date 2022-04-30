"Latex Config
let g:vimtex_quickfix_enabled = 0
let g:tex_flavor  = 'latex'
" let g:tex_conceal = ''
let g:vimtex_fold_manual = 1
" let g:vimtex_latexmk_continuous = 1
let g:vimtex_compiler_latexmk = {
        \ 'continuous' : 1,
        \}
let g:vimtex_compiler_progname = 'nvr'
" use skim if you are on Mac
" zathura can be downloaded on latex with the command 'sudo pacman -S zathura'
let g:vimtex_view_method = 'zathura'
" let g:vimtex_view_method = 'mupdf'
"switch back to this one later when it is fixed
au FileType tex let b:AutoPairs = AutoPairsDefine({'$':'$'})
