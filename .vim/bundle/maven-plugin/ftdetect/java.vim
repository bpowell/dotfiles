if exists("g:loaded_mavenplugin_autoload")
	finish
endif
let g:loaded_mavenplugin_autoload = 1

function! java#MakeCWinHelp()
	:echo "c to close"
	:echo "h for help"
endfunction

function! MakeCWinKeyMaps()
	:noremap <buffer> <silent> c :cclose<CR>
	:noremap <buffer> <silent> h :call MakeCWinHelp()<CR>
endfunction

function! java#goToProjectRoot()
	let pom = findfile('pom.xml', '.;')
	let dir = fnamemodify(expand(pom), ":h")
	cd `=dir`
endfunction

function! java#goToWorkingDir()
	cd `=s:curdir`
endfunction

function! java#setup()
	set errorformat=[ERROR]\ %f:[%l\\,%v]\ %m
	set errorformat+=%-G
	set makeprg=mvn\ clean\ package
	let s:curdir = expand('%:p:h')
	nmap <F6> :call java#goToProjectRoot()<CR>:silent make<CR>:copen<CR>:call MakeCWinKeyMaps()<CR>:call java#goToWorkingDir()<CR>:redraw!<CR>
endfunction

call java#setup()
