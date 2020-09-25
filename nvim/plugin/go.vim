" search for go files in cwd; invoke as `nvim +GoWorkspace`
function! GoWorkspace()
    next `fd -E '*_test.go' -E vendor .go`
endfunction
command! GoWorkspace call GoWorkspace()

augroup filetype_go
    autocmd!
    autocmd Filetype go nnoremap <silent> <leader>q :<C-u>call <SID>ag_toggle_ignore_go_tests()<cr>
    autocmd FileType go nmap <silent> <leader>i <Plug>(go-info)
    autocmd FileType go nnoremap <C-n> :cnext<CR>
    autocmd FileType go nnoremap <C-m> :cprevious<CR>
    autocmd FileType go nnoremap <silent> <leader>b :<C-u>call <SID>build_go_files()<cr>
    autocmd FileType go nnoremap <silent> <leader>d :GoDeclsDir<cr>
    autocmd FileType go nnoremap <silent> <leader>r :GoRun<cr>
    
    " completion on TAB, navigation with C-j, C-k, Enter to confirm
    autocmd FileType go inoremap <silent><expr> <TAB>
        \ pumvisible() ? "\<C-n>" :
        \ <SID>check_back_space() ? "\<TAB>" :
        \ "\<C-x>\<C-o>"
    autocmd FileType go inoremap <silent><expr> <C-j>
        \ pumvisible() ? "\<C-n>" : "\<C-j>"
    autocmd FileType go inoremap <silent><expr> <C-k>
        \ pumvisible() ? "\<C-p>" : "\<C-k>"
    " Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
    autocmd FileType go inoremap <expr> <cr>
        \ pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
augroup END

" run :GoBuild or :GoTestCompile based on the go file
function! s:build_go_files()
  let l:file = expand('%')
  if l:file =~# '^\f\+_test\.go$'
    call go#test#Test(0, 1)
  elseif l:file =~# '^\f\+\.go$'
    call go#cmd#Build(0)
  endif
endfunction

function! s:check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~# '\s'
 endfunction

let s:ag_ignore_go_tests = 0
function! s:ag_toggle_ignore_go_tests() abort
    let s:ag_ignore_go_tests = (s:ag_ignore_go_tests + 1) % 2 " flip
    let l:ackprg = 'ag --go --ignore -U --vimgrep '
    if s:ag_ignore_go_tests == 1
        let l:ackprg .= '--ignore "*_test.go"'
    endif
    let g:ackprg = l:ackprg
endfunction
