filetype off
execute pathogen#infect()

"
" ** general options
"
let mapleader = "\<Space>"
syntax on
filetype plugin indent on

set nu hlsearch incsearch
set background=dark

set smartindent expandtab
set showmode showcmd

set tabstop=4 shiftwidth=4 softtabstop=4

"
" ** where .swp files are stored
"
set backupdir=/tmp

"
" ** make statusline more verbose
"
set laststatus=2
set statusline=%F%m%r%h%w\ [format=%{&ff}]\ [type=%Y]\ [current=%04l,%04v][%p%%]\ [lines=%L] 

" where to store .swp files
set dir=/tmp

"
" ** load linux kernel coding style
"
let g:loaded_linuxsty = 1

if has('cscope')
	set cscopetag cscopeverbose
	
	if has('quickfix')
	    set cscopequickfix=s-,c-,d-,i-,t-,e-
	endif
	
	cnoreabbrev csa cs add
	cnoreabbrev csf cs find
	cnoreabbrev csk cs kill
	cnoreabbrev csr cs reset
	cnoreabbrev css cs show
	cnoreabbrev csh cs help
	
	" command -nargs=0 Cscope cs add $VIMSRC/src/cscope.out $VIMSRC/src $CSCOPE_DIR/cscope.out
	" command -nargs=0 Cscope cs add $CSCOPE_DIR
endif


" ** Make a simple "search" text object. (from: http://vim.wikia.com/wiki/Copy_or_change_search_hit)
" It allows the following search-replace flow:
" search something using /something
" hit csSOMETHING<Esc>, this will replace what was searched (i.e. something) with SOMETHING
" repeat sequence using n, to jump to next match, and hit . whenever you want to replace
vnoremap <silent> s //e<C-r>=&selection=='exclusive'?'+1':''<CR><CR>
    \:<C-u>call histdel('search',-1)<Bar>let @/=histget('search',-1)<CR>gv
omap s :normal vs<CR>

"
" ** INSERT mappings
"
imap jj <Esc>

"
" ** NORMAL mappins
"
nmap <F3> :cnext<CR>
nmap <F2> :cprev<CR>
nmap <Leader><Leader> V
nmap <Leader>qq :q!<CR><Esc>
nmap <Leader>wq :wq<CR><Esc>
nmap <Leader>ww :w<CR><Esc>
nmap zz :qa!<CR><Esc>

au filetype python nnoremap <Leader>\ :RopeGotoDefinition<CR>
au filetype python nnoremap <Leader>cd :RopeShowDoc<CR>
au filetype puthon nnoremap <Leader>cn :RopeFindOccurences<CR>

"
" ** VISUAL mappings
"
vmap <Leader>y "+y
vmap <Leader>d "+d
nmap <Leader>p "+p
nmap <Leader>P "+P
vmap <Leader>p "+p
vmap <Leader>P "+P

nmap <F8> :!g++ --std=c++11 -Wall -g -o solution % && ./solution<CR>

function Self_compile(extra_lib)
    let l:lnk = "q"
    if !empty(a:extra_lib)
        let l:lnk = " -l" . a:extra_lib
    endif

   execute "!g++ --std=c++11 -Wall -g -o solution %" . l:lnk
endfunction

nmap <F11> :call Self_compile("udev")<CR>
nmap <F12> :!./solution<CR>
