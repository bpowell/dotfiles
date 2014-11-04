runtime bundle/vim-pathogen/autoload/pathogen.vim
call pathogen#infect()
filetype on
filetype indent on
filetype plugin on
syntax on
set lazyredraw
set ai
colorscheme darkblue
set nu
set laststatus=2
set dict=/usr/share/dict/words
set statusline=%F

"au FileType java set makeprg=javac\ % |
"	\ :nmap <F9> :!java -cp . %:r<CR>:redraw!<CR>|
"	\ :map! <F2> <Esc>aSystem.out.printf("");<Esc>2hi

au FileType c set makeprg=gcc\ -o\ %:r\ % |
	\ :nmap <F9> :!./%:r<CR> |
	\ :map! <F2> <Esc>aprintf("");<Esc>2hi |
	\ :nmap <F8> :!gdb ./%:r<CR>:redraw!<CR>

au FileType cpp set makeprg=g++\ -o\ %:r\ % |
	\ :nmap <F9> :!./%:r<CR>:redraw!<CR> |
	\ :map! <F2> <Esc>acout << 

if filereadable("Makefile")
	au FileType * set makeprg=make
endif

function! MakeCWinHelp()
	:echo "c to close"
	:echo "h for help"
endfunction

function! MakeCWinKeyMaps()
	:noremap <buffer> <silent> c :cclose<CR>
	:noremap <buffer> <silent> h :call MakeCWinHelp()<CR>
endfunction

"nmap <F6> :silent make<CR>:copen<CR>:call MakeCWinKeyMaps()<CR>:redraw!<CR>
nmap <F7> :silent make -g3<CR>:copen<CR>:call MakeCWinKeyMaps()<CR>:redraw!<CR>
nmap <F3> "zyw oSystem.out.printf("",<Esc>pi);<Esc>1dd"
nmap <F4> "zyeb"xywmagg]m%O<Esc>opublic <Esc>"xpAget<Esc>"zpb3l~A()<Esc>o{<Esc>oreturn this.<Esc>"zpA;<Esc>o}<Esc>o<Esc>opublic void set<Esc>"zpb3l~A(<Esc>"xpA <Esc>"zpA)<Esc>o{<Esc>othis.<Esc>"zpA = <Esc>"zpA;<Esc>o}<Esc>'a
