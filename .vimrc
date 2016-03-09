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
Plugin 'scrooloose/nerdtree'
Plugin 'tpope/vim-fugitive'
Plugin 'kien/ctrlp.vim'
Plugin 'ervandew/supertab'
Plugin 'Yggdroot/indentLine.git'
Plugin 'Raimondi/delimitMate.git'
Plugin 'godlygeek/tabular'
Plugin 'vim-pandoc/vim-pandoc'
Plugin 'vim-pandoc/vim-pandoc-syntax'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'tpope/vim-commentary'
Plugin 'tpope/vim-surround'
Plugin 'jceb/vim-orgmode'
Plugin 'tpope/vim-speeddating'
Plugin 'tpope/vim-repeat'
Plugin 'itchyny/calendar.vim'
Plugin 'ervandew/eclim'
Plugin 'chriskempson/base16-vim'
Plugin 'junegunn/fzf'

call vundle#end()

syntax on				"Syntax highlighting on

set laststatus=2			"Show powerline
set number				"Show linenumbers
set cursorline				"Show a visual line under current one
set showmatch				"Show matching brackets
set tabstop=8
set shiftwidth=8
set noexpandtab
set relativenumber
set hlsearch 				"Highlight search results


" Markdown settings
let g:vim_markdown_folding_disabled=1
let g:vim_markdown_math=1

let mapleader = " "			"Set leader to space

" IndentLine Settings
let g:indentLine_char = '|'

" Highlight 80th column
if (exists('+colorcolumn'))
	set colorcolumn=80
	highlight ColorColumn ctermbg=4*
endif

" Keybindings
"Moves current line down
nnoremap - ddp
"Moves current line up
nnoremap _ ddkP
" FAST BUFFER MOVEMENT
nnoremap <Leader>l :bnext<CR>
nnoremap <Leader>h :bprevious<CR>
nnoremap <Leader>p :CtrlP<CR>

" Turn off pymode autoimport bullshit
let g:pymode_rope_autoimport = 0
let g:SuperTabDefaultCompletionType = 'context'

" Show tabs
set list
set listchars=tab:>\ 
highlight SpecialKey ctermfg=8

set term=xterm-256color
let base16colorspace=256
set background=dark
colorscheme base16-monokai

filetype plugin indent on
