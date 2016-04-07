let g:neomake_cargo_maker = neomake#makers#rust#cargo()
let g:neomake_enabled_makers = ['cargo']

" Auto build
autocmd! BufWritePost *.rs Neomake
setlocal makeprg=cargo\ build
nmap <Leader>r :!cargo run<CR>

