call plug#begin('~/.vim/plugged')
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'christoomey/vim-tmux-navigator'
call plug#end()

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

set ts=4
set sw=4

set nu
set relativenumber
syntax on
filetype plugin indent on
