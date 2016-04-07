" Auto build
autocmd! BufWritePost *.rs Neomake
setlocal makeprg=cargo\ build
nmap <Leader>r :!cargo run<CR>

