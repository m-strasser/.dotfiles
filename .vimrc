call plug#begin('~/.vim/plugged')
Plug 'altercation/vim-colors-solarized'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'christoomey/vim-tmux-navigator'
Plug 'vim-syntastic/syntastic'
Plug 'Valloric/YouCompleteMe'
Plug 'mileszs/ack.vim'
Plug 'digitaltoad/vim-pug'
Plug 'jceb/vim-orgmode'
Plug 'szw/vim-maximizer'
call plug#end()

set statusline=%{fugitive#statusline()}\ %f\ %h%m%r%=%-14.(%l,%c%V%)\ %P

let mapleader = " "

let g:fzf_action = {
	\	'ctrl-t':	'tab split',
	\	'ctrl-x':	'split',
	\	'ctrl-v':	'vsplit' }
let g:fzf_layout = { 'down': '~40%' }

nnoremap <leader>j :FZF<CR>

function! s:buflist()
	redir	=> ls
	silent	ls
	redir	END
	return split(ls, '\n')
endfunction

function! s:bufopen(e)
	execute 'buffer' matchstr(a:e, '^[ 0-9]*')
endfunction

nnoremap <silent> <leader><leader> :call fzf#run(fzf#wrap({
\	'source':	reverse(<sid>buflist()),
\	'sink':		function('<sid>bufopen'),
\	'options':	'+m',
\	'down':		len(<sid>buflist()) + 2
\}))<CR>

nnoremap <leader>pdj :FZF $PROJECT<CR>

" ACK mappings
" Maybe add some standard flags here
" An ftplugin would be useful to search only matching filetypes?
nnoremap <leader>a :Ack! 
nnoremap <leader>da :Ack! --ignore-dir=tests $WWWDIR/drupal7/projects/ --match 
nnoremap <leader>pda :Ack! --ignore-dir=tests $PROJECT --match 
" Sets $PROJECT to the path of the current buffer
nnoremap <leader>sp :let $PROJECT=expand('%:p')<CR>

" Syntastic settings
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_aggregate_errors = 1

" vim-fugitive mappings
nnoremap <leader>gs :Gstatus<CR>
nnoremap <leader>gc :Gcommit -m "

" vim-maximize settings
nnoremap <leader>f :MaximizerToggle<CR>

" Solarized settings

set t_co=16
set background=dark
colorscheme solarized

" General settings
set list
set listchars=tab:>-

set ts=2
set sw=2

set nu
set relativenumber
syntax on
filetype plugin indent on
