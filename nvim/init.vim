let s:python_host_path='/usr/bin/'
if has('macunix')
    s:python_host_path='/usr/local/bin/'
endif
let g:python_host_prog = s:python_host_path . 'python2'
let g:python3_host_prog = s:python_host_path . 'python3'
let g:mapleader = "\<Space>"

set bg=dark
set nu hlsearch incsearch relativenumber
set showmode showcmd
set tabstop=4 shiftwidth=4 softtabstop=4 expandtab smartindent smarttab
set laststatus=2
set wfh " win fixed height
set wfw " win fixed width

highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/

call plug#begin('~/.nvim/plugged')
Plug 'tpope/vim-sensible'

" search
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
nnoremap <silent> <leader>l :Buffers<cr>
let g:fzf_layout = { 'window': 'enew' }
nmap <leader><tab> <plug>(fzf-maps-n)

" look and feel
Plug 'itchyny/lightline.vim'
if !has('gui_running')
  set t_Co=256
endif
let g:lightline = { 'colorscheme': 'wombat' }
Plug 'fxn/vim-monochrome'
let g:monochrome_italic_comments = 1
Plug 'morhetz/gruvbox'

" Golang
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
let g:go_bin_path = $HOME."/go/bin"
let g:go_def_mode = 'godef'
" let g:go_gocode_propose_source = 0
let g:go_highlight_functions = 1  
let g:go_highlight_methods = 1  
let g:go_highlight_structs = 1  
let g:go_highlight_operators = 1  
let g:go_highlight_build_constraints = 1  
let g:go_highlight_types = 1
let g:go_highlight_fields = 1

" autocomplete
if has('nvim')
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
else
  Plug 'Shougo/deoplete.nvim'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif
let g:deoplete#enable_at_startup = 1
Plug 'deoplete-plugins/deoplete-go', { 'do': 'make'}

Plug 'mileszs/ack.vim'
let g:ackprg = 'ag --go --cc --asm --cpp -U --vimgrep'

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
autocmd FileType go nnoremap <leader>b  <Plug>(go-build)
autocmd FileType go nnoremap <leader>t  <Plug>(go-test)
autocmd FileType go nnoremap <C-]> :GoDef<cr>
autocmd FileType go nnoremap <buffer> <leader>c I//<esc>
augroup END
augroup filetype_python
autocmd!
autocmd FileType python nnoremap <buffer> <leader>c I#<esc>
augroup END
