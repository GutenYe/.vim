" set filetype=x  " unconditionally
" setfiletype x   " execute if 'filetype' is nil
" if &ft == 'pascal' | set ft=mypascal | endif

if exists("did_load_filetypes")
  finish
endif

augroup filetypedetect
  au! BufNewFile,BufRead *.json				setfiletype json
  au! BufNewFile,BufRead *.txt				setfiletype text
  au! BufNewFile,BufRead *.xyz				setfiletype drawing
  au! BufNewFile,BufRead *.log				setfiletype log
  au! BufNewFile,BufRead *.hjs				setfiletype handlebars
  au! BufNewFile,BufRead *.handlebars	setfiletype handlebars
  au! BufNewFile,BufRead *.ebnf				setfiletype ebnf
  au! BufNewFile,BufRead *.less			  setfiletype less
  au! BufNewFile,BufRead .xinitrc 		setfiletype sh
  au! BufNewFile,BufRead Make.*				setfiletype make
  au! BufNewFile,BufRead Ragfile			setfiletype ruby
  au! BufNewFile,BufRead Thorfile			setfiletype ruby
  au! BufNewFile,BufRead *.watchr			setfiletype ruby
  au! BufNewFile,BufRead *rtorrent.rc setfiletype rtorrent 
  au! BufNewFile,BufRead ~/.zsh/completion/*   setfiletype zsh 
  au! BufNewFile,BufRead .zcmrc       setfiletype zsh 
  au! BufNewFile,BufRead _zshrc       setfiletype zsh 
  au! BufNewFile,BufRead _zprofile    setfiletype zsh 
  au! BufNewFile,BufRead /etc/nginx/*.conf        setfiletype nginx 
  au! BufNewFile,BufRead /etc/nginx/extra/*.conf  setfiletype nginx 
  au! BufNewFile,BufRead /etc/dbus-1/*/*.conf  setfiletype xml 
  au! BufNewFile,BufRead /etc/conf.d/*    setfiletype sh 
augroup end
