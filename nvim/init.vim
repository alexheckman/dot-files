let s:python_host_path='/usr/bin/'
if has('macunix')
    let s:python_host_path='/usr/local/bin/'
endif
let g:python_host_prog = s:python_host_path . 'python2'
let g:python3_host_prog = s:python_host_path . 'python3'
let g:mapleader = "\<Space>"

filetype on

set autowrite
set hidden
set noshowmode
set linebreak

" some servers have issues with backup files, see #649
set nobackup
set nowritebackup

" Better display for messages
set cmdheight=1
set laststatus=2

" you will have bad experience for diagnostic messages when it's default 4000.
set updatetime=100

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

" ignore pattern when searching for files
" set wildignore=**/vendor/**

" display
set t_Co=256

highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/

" Plugins
"
call plug#begin('~/.nvim/plugged')
" git
"
Plug 'tpope/vim-fugitive'

" search
"
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
let g:fzf_layout = { 'window': 'enew' }
let g:fzf_preview_window = ''

Plug 'mileszs/ack.vim'
let g:ackprg = 'ag -U --vimgrep'

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
let g:go_highlight_functions = 1  
let g:go_highlight_methods = 0
let g:go_highlight_interfaces = 0
let g:go_highlight_structs = 0
let g:go_highlight_operators = 0
let g:go_highlight_build_constraints = 1  
let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_list_type = "quickfix"
let g:go_fmt_command = "goimports"
let g:go_addtags_transform = "camelcase"

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

colorscheme gruvbox

inoremap jj <esc>

nnoremap <leader><leader> V
nnoremap <leader>ww :w<cr><esc>
nnoremap <silent> <leader><Enter> :terminal<cr>
nnoremap <silent> <leader>\ :vsplit<cr>

vnoremap <leader>y "+y
vnoremap <leader>d "+d
nnoremap <leader>p "+p
nnoremap <leader>P "+P
vnoremap <leader>p "+p
vnoremap <leader>P "+P

tnoremap <esc> <C-\><C-n>

nnoremap <leader>a :Ack! '\b<cword>\b'<cr>
nnoremap <leader>s :%s/\<<C-r><C-w>\>//g<Left><Left>
vnoremap <leader>s :s/\<<C-r><C-w>\>//g<Left><Left>

nnoremap <silent> <C-p> :Buffers<cr>
nnoremap <silent> <C-f> :Files<cr>
nnoremap <silent> <C-h> :History:<cr>
