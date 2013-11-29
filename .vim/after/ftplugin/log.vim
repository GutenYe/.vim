if exists('b:did_log_ftplugin')
	finish
endif
let s:did_log_ftplugin=1

set updatetime=1000
setlocal autoread
exec 'autocmd CursorHold '.expand('%:p').' checktime'
