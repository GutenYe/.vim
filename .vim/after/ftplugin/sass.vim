set expandtab
nnoremap <silent> ro :update<CR>:!sass "<C-R>=expand('%:p')<CR>"<CR>

set foldmethod=marker 


" @fold
for i in range(1,4)
  " \" %%
  let cmd=printf("iabbr <buffer> {{%s //{{{%s<C-R>=Eatchar('\s')<CR>",i,i)
  exec cmd
endfor 

for i in range(1,4)
  let cmd=printf("iabbr <buffer> }}%s //}}}%s<C-R>=Eatchar('\s')<CR>",i,i)
  exec cmd
endfor 

" ¤ º \ (space) \" \\% \\@
set foldtext=Gfoldtext('\\v\\@\|^#\ \|¤\|º\|`')
set commentstring=//%s

