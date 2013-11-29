set expandtab
set dictionary=~/.vim/dict/javascript.dict

for i in range(1,4)
	let cmd=printf("iabbr {{%s //{{{%s<C-R>=Eatchar('\s')<CR>",i,i)
	exec cmd
endfor 
for i in range(1,4)
	let cmd=printf("iabbr }}%s //}}}%s<C-R>=Eatchar('\s')<CR>",i,i)
	exec cmd
endfor 
