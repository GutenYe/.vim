set expandtab
nnoremap <silent> ro :update<CR>:!ruby "<C-R>=expand('%:p')<CR>"<CR>
if $ISMS
else
  nnoremap <silent> ri :update<CR>:!RUBYOPT=""  <C-R>=expand("%:p")<CR><CR>
  nnoremap	    zi :update<CR>:!RUBYOPT=""  <C-R>=expand("%:p")." "<CR>
end


" @fold
for i in range(1,4)
  " \" %%
  let cmd=printf("iabbr <buffer> {{%s #{{{%s<C-R>=Eatchar('\s')<CR>",i,i)
  exec cmd
endfor 

for i in range(1,4)
  let cmd=printf("iabbr <buffer> }}%s #}}}%s<C-R>=Eatchar('\s')<CR>",i,i)
  exec cmd
endfor 

" \" \%
" ¤ º \ (space) \" \\% \\@
set foldtext=Gfoldtext('\\v\\@\|^#\ \|¤\|º\|`')
set commentstring=#%s

" filetype indent off 
