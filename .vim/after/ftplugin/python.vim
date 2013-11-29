set expandtab
nnoremap <silent> ro :update<CR>:!python "<C-R>=expand('%:p')<CR>"<CR>
nnoremap	    zi :update<CR>:!python=""  <C-R>=expand("%:p")." "<CR>


set commentstring=#%s
