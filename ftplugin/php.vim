nnoremap <leader>a :Ack --php 
set ts=2 sw=2 expandtab
let g:syntastic_php_checkers = ['php', 'phpcs', 'phpmd']
let g:syntastic_php_phpcs_args = "--standard=Drupal --extensions=php,module,inc,install,test,profile,theme,css,info,txt,md "
