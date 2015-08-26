set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'rust-lang/rust.vim'
Plugin 'vim-scripts/Conque-GDB'
Plugin 'klen/python-mode'
Plugin 'bronson/vim-trailing-whitespace'

call vundle#end()

python from powerline.vim import setup as powerline_setup
python powerline_setup()
python del powerline_setup

syntax on				"Syntax highlighting on
set laststatus=2			"Show powerline
set number				"Show linenumbers
set cursorline				"Show a visual line under current one
set showmatch				"Show matching brackets

" Highlight 80th column
if (exists('+colorcolumn'))
	set colorcolumn=80
	highlight ColorColumn ctermbg=4*
endif

filetype plugin indent on
