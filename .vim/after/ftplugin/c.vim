set expandtab
set commentstring=//%s

" @fold
for i in range(1,4)
	let cmd=printf("iabbr <buffer> {{%s //{{{%s<C-R>=Eatchar('\s')<CR>",i,i)
	exec cmd
endfor 
for i in range(1,4)
	let cmd=printf("iabbr <buffer> }}%s //}}}%s<C-R>=Eatchar('\s')<CR>",i,i)
	exec cmd
endfor 
