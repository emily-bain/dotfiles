set tabstop=4
set softtabstop=4

set mouse=a
set expandtab

filetype on

augroup indent_settings
  au!
  au BufEnter *.js set softtabstop=2
  au BufEnter *.py set softtabstop=4
augroup END

function! Preserve(command)
    "Preparation: save last search, and cursor position.
    let _s=@/
    let l = line(".")
    let c = col(".")
    " Do the business:
    execute a:command
    " Clean up: restore previous search history, and cursor position
    let @/=_s
    call cursor(l, c)
endfunction

" clean up trailing witespace
nmap <leader>$ :call Preserve("%s/\\s\\+$//e")<CR>

" clean up trailing white space on save
autocmd BufWritePre * :call Preserve("%s/\\s\\+$//e")


