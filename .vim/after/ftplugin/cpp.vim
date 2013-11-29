" first cpp.vim the c.vim
" so in c.vim
set commentstring=//%s
set expandtab

nnoremap ro :silent! :w<CR>:!<C-R>=substitute(expand("%:p"), "\\\.cc$", "", "")<CR><CR>

