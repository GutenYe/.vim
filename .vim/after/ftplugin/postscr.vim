if exists('b:did_postscr_ftplugin')
	finish
endif
let s:did_postscr_ftplugin=1

nnoremap <buffer> ra /@
nnoremap <buffer> ro :!gs %<CR>
" abbr "{{{1
for i in range(1,4)
	let cmd=printf("iabbr <buffer> {%s %%{{{%s<C-R>=Eatchar('\s')<CR>",i,i)
	exec cmd
endfor 
for i in range(1,4)
	let cmd=printf("iabbr <buffer> }%s %%}}}%s<C-R>=Eatchar('\s')<CR>",i,i)
	exec cmd
endfor 
"}}}1
set foldmethod=marker | set commentstring=%%s
" set foldtext=Gfoldtext('\\v¤\|º\|`')
set foldtext=Gfoldtext('\\v\\@\|^\\%\ ')
