" Set { and } to move up/down 1 function
nmap } ]M
nmap { [M

" <leader> + Enter runs current script in ipython
nnoremap <leader><CR> :call VimuxRunCommand('ipython ' . expand('%:p')) <CR>
