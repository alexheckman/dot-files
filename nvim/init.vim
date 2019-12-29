let s:python_host_path='/usr/bin/'
if has('macunix')
    let s:python_host_path='/usr/local/bin/'
endif
let g:python_host_prog = s:python_host_path . 'python2'
let g:python3_host_prog = s:python_host_path . 'python3'
let g:mapleader = "\<Space>"

" if hidden is not set, TextEdit might fail.
set hidden
set noshowmode

" some servers have issues with backup files, see #649
set nobackup
set nowritebackup

" Better display for messages
set cmdheight=1
set laststatus=2

" you will have bad experience for diagnostic messages when it's default 4000.
set updatetime=300

" don't give |ins-completion-menu| messages.
set shortmess+=c

" always show signcolumns
set signcolumn=yes

" some common options
set bg=dark
set number relativenumber
set hlsearch incsearch 
set showmode showcmd
set tabstop=4 shiftwidth=4 softtabstop=4 expandtab smartindent smarttab

" display
set t_Co=256
colorscheme gruvbox

highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/

" Plugins
"
call plug#begin('~/.nvim/plugged')
" search
"
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
let g:fzf_layout = { 'window': 'enew' }
nnoremap <silent> <C-p> :Buffers<cr>
nnoremap <silent> <C-f> :Files<cr>
nnoremap <leader><tab> <plug>(fzf-maps-n)

Plug 'mileszs/ack.vim'
let g:ackprg = 'ag --go --cc --asm --cpp -U --vimgrep'

" look and feel
"
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
let g:airline_theme = 'wombat'
Plug 'morhetz/gruvbox'

" programming
"
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
let g:go_def_mode='gopls'
let g:go_info_mode='gopls'
" default mapping is replaced by CoC
let g:go_def_mapping_enabled = 0
let g:go_highlight_functions = 1  
let g:go_highlight_methods = 1  
let g:go_highlight_structs = 1  
let g:go_highlight_operators = 1  
let g:go_highlight_build_constraints = 1  
let g:go_highlight_types = 1
let g:go_highlight_fields = 1

Plug 'neoclide/coc.nvim', {'branch': 'release'}

" misc
"
Plug 'godlygeek/tabular'
call plug#end()

let g:elite_mode = 1
 " disable arrow movement, resize splits instead.
if get(g:, 'elite_mode')
    nnoremap <Up> :resize +2<cr>
    nnoremap <Down> :resize -2<cr>
    nnoremap <Left> :vertical resize -2<cr>
    nnoremap <Right> :vertical resize +2<cr>
    nnoremap <C-Up> :resize +5<cr>
    nnoremap <C-Down> :resize -5<cr>
    nnoremap <C-Left> :vertical resize -5<cr>
    nnoremap <C-Right> :vertical resize +5<cr>
endif 


inoremap jj <esc>

nnoremap <leader><leader> V
nnoremap <leader>ww :w<cr><esc>
nnoremap <silent> <leader><Enter> :terminal<cr>

vnoremap <leader>y "+y
vnoremap <leader>d "+d
nnoremap <leader>p "+p
nnoremap <leader>P "+P
vnoremap <leader>p "+p
vnoremap <leader>P "+P

nnoremap <F5> :bprev<cr>
nnoremap <F6> :bnext<cr>

tnoremap <esc> <C-\><C-n>

nnoremap <leader>a :Ack <cword><cr>
nnoremap <leader>s :%s/\<<C-r><C-w>\>//g<Left><Left>
vnoremap <leader>s :s/\<<C-r><C-w>\>//g<Left><Left>

nnoremap <leader>ve :vsplit $MYVIMRC<cr>
nnoremap <leader>vs :source $MYVIMRC<cr>

augroup filetype_go
autocmd!
autocmd FileType go nnoremap <leader>gb :GoBuild<cr>
autocmd FileType go nnoremap <leader>gt :GoTestCompile<cr>
autocmd FileType go nnoremap <leader>gd :GoDef<cr>
autocmd FileType go nnoremap <leader>gr :GoReferrers<cr>
autocmd FileType go nnoremap <C-]>      :GoDef<cr>
augroup END
augroup filetype_python
autocmd!
autocmd FileType python nnoremap <buffer> <leader>c I#<esc>
augroup END
