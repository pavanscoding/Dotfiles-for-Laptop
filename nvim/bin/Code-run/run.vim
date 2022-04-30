augroup compileandrun
    autocmd!
    " C++
    " autocmd filetype cpp nnoremap <buffer> <f3> :w<cr>:vsplit<cr>:vert ter g++ -std=c++17 -Wshadow -Wall -O2 -Wno-unused-result "%"<cr>i 
    " autocmd filetype cpp nnoremap <buffer> <f4> :vnew <bar> :te ./a.out <cr>i
    nnoremap <F3> :CphReceive<cr>
    autocmd filetype cpp nnoremap <buffer> <F4> :CphTest<cr>
    autocmd filetype cpp nnoremap <buffer> <F8> :w <bar>!g++ -std=c++17 -Wshadow -Wall -O2 -Wno-unused-result "%"<cr> :vnew <bar> :te ./a.out <cr><cr>i
    " autocmd filetype cpp nnoremap <buffer> <F8> :CompetitestRun <cr>
    "Python 
    autocmd Filetype python nnoremap <buffer> <f8> :w<CR>:vsplit<cr>:vert ter python3 "%"<CR>i
    "Latex
    autocmd filetype tex nnoremap <buffer> <f8> :w <bar>:VimtexCompile <cr>
    " autocmd filetype tex nnoremap <buffer> <f7> :w <bar>!latexmk %<cr>:w <bar>!asy -noV %:r-*.asy<cr>:w <bar> !latexmk %:r<cr><cr>:w<cr>
    "if there is an error with the first one, use the bottom one
    " autocmd filetype tex nnoremap <buffer> <f7> :w <bar>!latexmk %:r<cr>:w <bar>!asy -noV -render=0 %:r-*.asy<cr>:w <bar> !latexmk %:r<cr><cr>w<cr>
    " Java
     autocmd filetype java nnoremap <buffer> <f3> :w<cr>:vsplit<cr>:vert ter javac "%"<cr>i 
     " autocmd filetype java nnoremap <buffer> <f4> :vnew <bar> :te java "%:h" <cr>i
     autocmd filetype java nnoremap <buffer> <f4> :!java -cp %:p:h %:t:r <cr> i
     autocmd filetype java nnoremap <buffer> <F8> :w <bar>!javac "%"<cr> :vnew <bar> :te java "%:h" <cr><cr>i
     " autocmd filetype markdown nnoremap <buffer>  :w <bar>:call Compile()<cr><cr>:call Preview()<cr><cr><cr>
augroup END
