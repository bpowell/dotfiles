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

"Rename tabs to show tab# and # of viewports
if exists("+showtabline")
    function! MyTabLine()
        let s = ''
        let wn = ''
        let t = tabpagenr()
        let i = 1
        while i <= tabpagenr('$')
            let buflist = tabpagebuflist(i)
            let winnr = tabpagewinnr(i)
            let s .= '%' . i . 'T'
            let s .= (i == t ? '%1*' : '%2*')
            let s .= ' '
            let wn = tabpagewinnr(i,'$')

            let s .= (i== t ? '%#TabNumSel#' : '%#TabNum#')
            let s .= i
            let s .= ' %*'
            let s .= (i == t ? '%#TabLineSel#' : '%#TabLine#')
            let bufnr = buflist[winnr - 1]
            let file = bufname(bufnr)
            let buftype = getbufvar(bufnr, 'buftype')
            if buftype == 'nofile'
                if file =~ '\/.'
                    let file = substitute(file, '.*\/\ze.', '', '')
                endif
            else
                let file = fnamemodify(file, ':p:t')
            endif
            if file == ''
                let file = '[No Name]'
            endif
            let s .= file
            let s .= (i == t ? '%m' : '')
            let i = i + 1
        endwhile
        let s .= '%T%#TabLineFill#%='
        return s
    endfunction
    set stal=2
    set tabline=%!MyTabLine()
endif
"End Rename Tabs

au FileType java set makeprg=javac\ % |
	\ :nmap <F9> :!java -cp . %:r<CR>:redraw!<CR>|
	\ :map! <F2> <Esc>aSystem.out.printf("");<Esc>2hi

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

nmap <F6> :silent make<CR>:copen<CR>:call MakeCWinKeyMaps()<CR>:redraw!<CR>
nmap <F7> :silent make -g3<CR>:copen<CR>:call MakeCWinKeyMaps()<CR>:redraw!<CR>
nmap <F3> "zyw oSystem.out.printf("",<Esc>pi);<Esc>1dd"
nmap <F4> "zyeb"xywmagg]m%O<Esc>opublic <Esc>"xpAget<Esc>"zpb3l~A()<Esc>o{<Esc>oreturn this.<Esc>"zpA;<Esc>o}<Esc>o<Esc>opublic void set<Esc>"zpb3l~A(<Esc>"xpA <Esc>"zpA)<Esc>o{<Esc>othis.<Esc>"zpA = <Esc>"zpA;<Esc>o}<Esc>'a
