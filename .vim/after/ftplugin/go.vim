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

func! s:run()
	update

	let rst = system("make")
	if v:shell_error
		echo rst
		return
	endif

	" run
	exec "!".b:exe_file
endfunc

" nnoremap <buffer> <silent> ro :call <SID>run()<CR>
nnoremap <buffer> <silent> ro :update<CR>:!go run <C-R>=expand("%:p")<CR><CR>
