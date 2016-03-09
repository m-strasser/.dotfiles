nnoremap <Leader>b :!cargo build <CR>
nnoremap <Leader>t :!cargo test <CR>
setlocal tags=rusty-tags.vi;/,~/.bin/rust/rusty-tags.vi
autocmd BufWrite *.rs :silent !rusty-tags vi
