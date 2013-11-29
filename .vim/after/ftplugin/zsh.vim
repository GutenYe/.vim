set expandtab
nnoremap <silent> ro :update<CR>:!zsh "<C-R>=expand('%:p')<CR>"<CR>

if exists('did_zsh_ftplugin')
	finish
endif
set  commentstring=#%s
set foldtext=Gfoldtext('\\v\\@\|^#\ ')
