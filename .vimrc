" ~/.vimrc_win32


ruby <<EOF
  # encoding: utf-8
  $: << File.join(ENV["HOME"], ".vim/bundle")
EOF


" ¤bundle "{{{1
set nocompatible  
filetype off
set runtimepath+=~/.vim/bundle/vundle/
call vundle#rc()
Bundle "gmarik/vundle"
runtime Pluginfile
filetype plugin indent on " ftplugin/ indent/
"}}}1
" ¤core "{{{1
" cmdline
cnoremap <C-H> <Left>
cnoremap <C-L> <Right>
cnoremap <C-J> <Up>
cnoremap <C-K> <Down>
"}}}1

" ¤settings "{{{1
let $TERM = "xterm" " 256 color

" term_w use winwidth(0)
" ¤global variables  "{{{2
let YWDICT = $ONE.'/c/en_new/dic/ywdict'
let PI = 3.14159265359
let E  = 2.71828182846

if $OS=="Windows_NT" | let $ISWIN32=1 | else | let $ISWIN32=0 | end

" system "{{{2
" set runtimepath+=~/.vim/pkgs/alternate,~/.vim/pkgs/book/,~/.vim/pkgs/guten,~/.vim/pkgs/comment,~/.vim/pkgs/gnote,~/.vim/pkgs/log,~/.vim/pkgs/pacman_search,~/.vim/pkgs/tst,~/.vim/pkgs/gnote2,~/.vim/pkgs/vim-rails " ~/dev/rb/gem.vim/  " ~/.vim/pkgs/en: no such file /opt/en/
set encoding=utf-8  " cp936.ms for plugin/math.vim ywnok: ms gim(:chinese) encoding_err 
set langmenu=en_US.UTF-8 " gui menu language
lang en_US.utf8  

set wildignore=*~,*.o,*.obj

" color
let $TERM = "xterm" " 256 color
set t_Co=256 " number of colors

" ¤completion
set wildmode=list:longest

set autowriteall  " :bn


""" ¤backup 
" set backup
" set backupskip=/tmp/*,
" set backupdir=./.backup,~/tmp,.,/tmp
" set backupext=~
" set backupskip+=/etc/cron.*/*

""" search 
set hlsearch		" highlight the search
set incsearch		" do incremental searching

""" ¤tab 
set tabstop=2
set shiftwidth=2
set noexpandtab
set smarttab

""" interface 
set ruler				" show the cursor position all the time
set showcmd     " Show (partial) command in the last line of the screen.  
"set display=lastline  " show as much as possible of the last line in a window

let mapleader = ','
"set hidden
set history=10	"command line history
set path=.,/usr/include, " gf :find

"set langmap=tn;jk,jk;tn	
" set imactivatekey=S-space " confict with gvim
" ¤tag
set tags=./tags,./TAGS,tags;,TAGS;

"}}}2
" plugin setting "{{{2

let g:C_MapLeader = "'"

let g:eruby_default_subtype = "text"
let g:SuperTabDefaultCompletionType = "context"
"}}}2
"}}}1

" ¤py "{{{1

"py <<EOF
"from vim import *
"from g2 import *
"from math import *
"import os
"EOF

"}}}1
" ¤rb  "{{{1
"let g:rubycomplete_buffer_loading = 1
"let g:rubycomplete_rails = 1
"let g:rubycomplete_classes_in_global = 1
"}}}1

" ¤map "{{{1
" <CTRL>  "{{{2
nnoremap <C-A> :call <SID>toggle_switch()<CR> 
nnoremap <C-J> :tag 
nnoremap <C-K> :Command 

imap <C-J> <C-X>
inoremap <C-L> <C-X><C-K>

"}}}2
" <ALT> "{{{2
noremap <M-n> 0

"}}}2
" map for z ¤zmap "{{{2
" Exclude: zz zt zb zj zk
" zo #lang
nnoremap zf :call <SID>togglefold()<CR>

"}}}2
" map for r ¤rmap "{{{2
" rm(man) rj(toggle_switch())
" nnoremap <silent> re :call Ywexchange()<CR>
" use " for space path: c:\guten tag\a.rb
"
" ro ri #lang
" ra in autocmd

nnoremap <silent> rl :nohlsearch<CR>
nnoremap <silent> rk :call search('^@!','b')<CR>zz
nnoremap rr r
nnoremap ry "+y
nnoremap rd "+d
nnoremap rp "+p

nnoremap rn :set number<CR>
nnoremap rfn :set nonumber<CR>
"}}}2
	" <Fn> "{{{2
" :write
nmap <F1> :update<CR>
vmap <F1> <Esc><F1>gv
imap <F1> <c-o><F1>
"}}}2

" Keyname: vim:keycodes <Nop> <Esc> <CR>  <C-.. S M>
" OneLowerKey: r m z [ ] ; - = <Tab>
" OneUpperKey: S C R Z K | \ , _ +
" Others: cc cl
" ^M(enter) 

"nmap  4  <C-]>
"imap  4  <C-]>

" for not trigger abbr
inoremap <space>  

nnoremap ; za 
onoremap \| :call search('^@!')<CR>k
noremap gt	F\|"tyt\|:let @/ = substitute(@t, "\|", "@", "")<CR>n
noremap ZZ :wq<CR>
noremap ZX :w<CR>

onoremap }  V}
onoremap v} v}



"}}}1
" ¤abbr "{{{1
" iab if if ()<left>
" iab main() int<CR>main()<CR>{<CR><CR><CR>}<UP><TAB>return 0;<UP><TAB>
" ab esc      
	"insert a (<Esc> key)
	"the first  makes the second  works. so output:   then is  output.

func! Eatchar(pat)
  let c = nr2char(getchar(0))
  return (c =~ a:pat) ? '' : c
endfunc
iabbr yw@ ywzhaifei@gmail.com<C-R>=Eatchar('\s')<CR>

"}}}1
" ¤command "{{{1
command Gcolor :runtime guten/color.vim
command Gcolortest :runtime guten/color_test.vim
command Test :exec ':e '.Grepath(expand("%"), '^\.\?\(.*\)$', '\.\1\.tags')
"}}}1
" ¤autocmd "{{{1
" clear all. when .vimrc source twice. autocmds will appear twice.
autocmd!	 

augroup guten
	autocmd!
  " When editing a file, always jump to the last known cursor position.
	autocmd BufReadPost *
    \ if line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal! g`\"" |
    \ endif
augroup end

autocmd FileType html :runtime ftplugin/xml.vim
autocmd FileType * :call s:filetype()

nnoremap <silent> ro :update<CR>:!<C-R>=expand("%:p")<CR><CR>
nnoremap  				zo :update<CR>:!<C-R>=expand("%:p")." "<CR>

" global
nnoremap ra /\(¤\\|∗\)

func! s:filetype()

	" ¤lang
	" map zo for c lanuage.. 
	if count(['c', 'cpp', 'go'], &filetype)==1
		let dir = expand("%:h")
		let name = expand("%:t:r")
		"let b:exe_file = dir.'/_pkg/'.name
		let b:exe_file = dir.'/'.name

		"nnoremap <silent> ri :update<CR>:!make<CR>
		nnoremap <silent> ri :update<CR>:make<CR>
		nnoremap <silent> ro :update<CR>:!<C-R>=b:exe_file<CR><CR>
		nnoremap 					zo :update<CR>:!<C-R>=b:exe_file." "<CR>

	elseif count(['java'], &filetype)==1
		let b:dir = expand("%:h")
		let b:name = expand("%:t:r")
		let b:exe_file = b:dir.'/'.b:name

		nnoremap <silent> ri :update<CR>:!javac %<CR>
		nnoremap <silent> ro :update<CR>:!java -classpath <C-R>=b:dir<CR> <C-R>=b:name<CR><CR>
		nnoremap 					zo :update<CR>:!<C-R>=b:exe_file." "<CR>


	" map zo for scripts lanuage
	else
		" wrong: it load after .vim/after/plutin/ruby.vim
		" nnoremap <silent> ro :update<CR>:!<C-R>=expand("%:p")<CR><CR>
		" nnoremap  				zo :update<CR>:!<C-R>=expand("%:p")." "<CR>
	endif

	"if count(['gnote'], &filetype)==1
	" 	nnoremap <buffer> ra /\(¤\\|º\)
	"endif

endfunc

"}}}1
" ¤gcc "{{{1
autocmd FileType c call Ywgcc()
autocmd FileType cpp call Ywgcc()

" --.yw[file]--
" gcc:xlib:-lX11
func! Ywgcc()
	let libs='' | let args=''
	if &filetype=='c' | let mkprg='gcc -I'.$ONE.'/include' 
	elseif &filetype=='cpp' | let mkprg='g++ -I'.$ONE.'/include' | endif
	if strlen(findfile('.yw', expand('%:h')))>0
		for line in readfile(expand('%:h').'/.yw')
			let outs=split(line, ':')
			if outs[0]=='gcc'
				if len(outs[1])!=0 | let libs=system('pkg-config --libs --cflags '.outs[1])[:-3] |endif
				if len(outs)>2 | let args=outs[2] | endif
			endif
		endfor
	endif
	let &makeprg=printf('%s -Wall -g -o %s %s %s %%', mkprg, expand('%:r'), libs, args)
	nnoremap rk :make<CR>
endfunc
"}}}1

" Zeus System:

"}}}1

" map - "{{{1
let s:shortcut = {'a': $ONE.'/tmp/ta', 'b': $ONE.'/tmp/tb', 'c': $G_NOTE.'/c.gnote', 'g': $G_NOTE.'/gtd.gnote', 'p': $G_NOTE.'/py.gnote', 
  \ 'n': $G_NOTE.'/net.gnote', 'd': $G_NOTE.'/db.gnote', 'l': $G_NOTE.'/li.gnote', '-': $G_NOTE.'/th.gnote',
  \'e': $G_NOTE.'/en.gnote', 'r': $G_NOTE.'/rb.gnote',
	\'z': '~/.zshrc', 'v': '~/.vimrc'
	\}
for [k,v] in items(s:shortcut)
	let gcmd = printf('nnoremap <silent> -%s :silent! :w<CR>:e %s<CR>', k, v)
	exec gcmd
endfor
"}}}1
" :Command ¤command "{{{1
" Edit_cmds 
		let Edit_cmds = { 
\ "man"   : "Man {0}",
\ "shr"   : "call Gfoldshift('right')",
\ "shl"   : "call Gfoldshift('left')",
\ "marks" : "marks 0123456789",
\ 		}
	
command -nargs=* Command :call s:command(<f-args>)

func! s:command(cmd) "{{{2
	" in Edit_cmds
	if has_key(g:Edit_cmds, a:cmd)
		exec g:Edit_cmds[a:cmd]
		return
	endif
endfunc 
"}}}1
" ¤help "{{{1
"
"
func! s:help(...)
	silent! update
	edit /tmp/vim_help
	setlocal filetype=help
endfunc
"}}}1
" ¤link ¤rg "{{{1
nnoremap <silent> rg :call <SID>link()<CR>
func! s:link() "{{{2
	let line = getline(".")
	let link = s:getlink(getline("."), '@|\(.\{-}\)@|', col("."))
	let path = Grepath(expand("%"), '^\.\?\(.*\)$', '\.\1\.tags')
	for line in readfile(path)
		if line =~ '^\V'.link
			let cmd = split(line, '\t')[-1]
			silent! update
			exec cmd
		endif
	endfor
endfunc
"}}}2
func! s:getlink(str, pat, cursor) "{{{2
" s:getlink(getline("."), '@|\(.\{-}\)@|', col("."))
	let str = a:str | let pat = a:pat | let cursor = a:cursor
	while 1
		let mbeg = match(str, pat)
		if mbeg == -1 || mbeg > cursor
			let output = '<undef>'
			break
		endif
		let mend = matchend(str, pat)
		if mend < cursor
			let str = strpart(str, mend)
			let cursor = cursor - mend + 1
			continue
		endif
		let output = substitute(str, '^.\{-}'.pat.'.*', '\1', '')
		break
	endwhile
	return output
endfunc
"}}}2
"}}}1
" ¤fold "{{{1
" 'foldclose'
set foldnestmax=3

set foldtext=Gfoldtext('\\v\|@\|¤\|º\|ĥ') " `
func! s:togglefold() "{{{2
	if !&foldlevel
		set foldlevel=1
	else
		set foldlevel=0
	endif
endfunc
"}}}2
" func Gfoldtext(hidden) for 'foldtext' "{{{2
func! Gfoldtext(hidden)
	let line = getline(v:foldstart)
	
	" line_count="128"
	let line_count = v:foldend - v:foldstart + 1
	if strlen(line_count) > 4
		let fmt = "%" . line_count . "s: "
	else
		let fmt = "%3s: "
	endif

	let pattern = substitute(&commentstring, '%s', '{{{\\d', 'g')
	let out = substitute(line, '\M' . pattern, '', 'g')
	let out = substitute(out, a:hidden, '', 'g')
	let folddashes=substitute(v:folddashes, '-', ' ', 'g')
	let width = winwidth(0)-len(folddashes[1:])-len(out)-len(line_count)
	if width < 0 | let width = 0 | endif
	let fill = ''
	for i in range(width) | let fill.='-' | endfor
	return folddashes[1:].out.fill.line_count
endfunc
"}}}2

for i in range(1,4)
	let cmd=printf("iabbr {{%s #{{{%s<C-R>=Eatchar('\s')<CR>",i,i)
	exec cmd
endfor 
for i in range(1,4)
	let cmd=printf("iabbr }}%s #}}}%s<C-R>=Eatchar('\s')<CR>",i,i)
	exec cmd
endfor 

"}}}1
" ¤insert "{{{1

set dictionary=$HOME/.vim/dict/default
set thesaurus=$HOME/.vim/dict/thesaurus

inoremap ^] ^X^]
inoremap ^D ^X^D
inoremap ^L ^X^L


" "}}}1
" ¤functions "{{{1
" func Grepath(path, pat, sub) "{{{2
" Grepath("ta", '^\.\?\(.*\)$', '\.\1\.tags') ==> .ta.tags
" Grepath("/home/guten/ta", ...) ==> /home/guten/.ta.tags
func! Grepath(path, pat, sub)
	let pathlst = matchlist(a:path, '^\(.*/\)\?\(.*\)$')
	return pathlst[1] . substitute(pathlst[2], a:pat, a:sub, '')
	endif
endfunc
"}}}2
func! Gfoldshift(left) "{{{2
	let endline_no=foldclosedend('.')
	if endline_no == -1 | let v:errmsg = "The cursor must at a closed fold" | echohl ErrorMsg | echo v:errmsg | echohl None | return -1 | endif
		
	if a:left=='left' | let left=-1 | else |  let left=1 | endif
	let startline_no=line('.')
	let comment_pat=printf('%s\|%s', printf(&commentstring,'{{{\d'), printf(&commentstring, '}}}\d'))
	let s_pat =printf('%s\|%s', printf('\('.&commentstring,'{{{\)\@<=\d'), printf('\('.&commentstring, '}}}\)\@<=\d'))
	for line_no in range(startline_no,endline_no)	
		let linestr=getline(line_no)
		let incre_num = matchstr(matchstr(linestr ,comment_pat), '\d')+left
		let newlinestr=substitute(linestr, s_pat, incre_num, '')
		call setline(line_no, newlinestr)
	endfor
endfunc
"}}}2
func! s:toggle_switch() 
	if &readonly
		edit #
	else
		update
		edit #
	endif
endfunc

" ¤env
func! s:env()
	let tmpfile = call tempname
	!cp ~/.en/	
endfunc


"}}}1

" archive "{{{1

" ¤lisp
let g:slimv_client = "python2 /home/guten/.vim/ftplugin/slimv.py -r 'terminal --role lisp -e \"@p @s -l sbcl -s\"'" " sbcl clisp
let g:slimv_ctags = "ctags -a --language-force=lisp *.lisp *.clj"
"}}}1

if $ISWIN32 | source $HOME/.vimrc_win32 | endif

command -nargs=1 Bs :BundleSearch <args>

" zencoding
imap <c-e> <c-y>,

set cc=80

let $PAGER=''
runtime ftplugin/man.vim

" ¤lua
let g:lua_complete_dynamic = 0 

" ¤colorscheme 
syntax enable
set background=dark
let g:solarized_termcolors=256
colorscheme solarized

set fileencodings=ucs-bom,utf-8,cp936
autocmd BufNewFile,BufRead *.md,*.markdown,*.textile set filetype=octopress


"let $XIKI_DIR = '/home/guten/.gem/ruby/1.9.1/gems/xiki-0.6.3'
"source /home/guten/.gem/ruby/1.9.1/gems/xiki-0.6.3/etc/vim/xiki.vim

" ¤coffee
" autocmd BufWritePost *.coffee CoffeeCompilea
