" Run xmllint on file with leader+Enter
nnoremap <leader><CR> :call VimuxRunCommand('xmllint --valid ' . expand('%:p')) <CR>
