" search for go files in cwd; invoke as `nvim +GoWorkspace`
function! GoWorkspace()
    next `fd -E vendor .go`
endfunction
command! GoWorkspace call GoWorkspace()
