set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'rust-lang/rust.vim'
Plugin 'vim-scripts/Conque-GDB'
Plugin 'klen/python-mode'
Plugin 'bronson/vim-trailing-whitespace'
Plugin 'itchyny/lightline.vim'
Plugin 'gergap/wombat256'
Plugin 'scrooloose/syntastic'
Plugin 'tpope/vim-fugitive'
Plugin 'kien/ctrlp.vim'

call vundle#end()

syntax on				"Syntax highlighting on

set laststatus=2			"Show powerline
set number				"Show linenumbers
set cursorline				"Show a visual line under current one
set showmatch				"Show matching brackets
set tabstop=8
set shiftwidth=8
set noexpandtab

let mapleader = ","			"Set leader to ,

let g:lightline = {'colorscheme' : 'wombat'}
colo wombat256

" Highlight 80th column
if (exists('+colorcolumn'))
	set colorcolumn=80
	highlight ColorColumn ctermbg=4*
endif

" Keybindings
nnoremap - ddp
nnoremap _ ddkP

" Turn off pymode autoimport bullshit
let g:pymode_rope_autoimport = 0

" Show tabs
set list
set listchars=tab:>\ 
highlight SpecialKey ctermfg=8

filetype plugin indent on
