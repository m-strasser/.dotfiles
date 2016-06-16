set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'bronson/vim-trailing-whitespace'
Plugin 'itchyny/lightline.vim'
Plugin 'scrooloose/syntastic'
Plugin 'scrooloose/nerdtree'
Plugin 'tpope/vim-fugitive'
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
Plugin 'junegunn/fzf'
Plugin 'junegunn/fzf.vim'
Plugin 'Valloric/YouCompleteMe'
Plugin 'regedarek/ZoomWin'
Plugin 'othree/html5.vim'
Plugin 'klen/python-mode'
Plugin 'benmills/vimux'

call vundle#end()

" Start pathogen
exec pathogen#infect()

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

" Enable per-directory vimrcs
set exrc
set secure

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
"let g:pymode_rope_autoimport = 0
let g:SuperTabDefaultCompletionType = 'context'
let g:pymode_virtualenv = 1

" Show tabs
set list
set listchars=tab:>\ 
"highlight SpecialKey ctermfg=8

"let base16colorspace=256
set background=dark
colorscheme solarized

" Autoclose scratch buffer on omnicomplete
autocmd CompleteDone * pclose

"
" Python Mode Customization
"

" Turn off autocompletion because it competes with YCM
let g:pymode_rope_complete_on_dot = 0
" Turn off documentation and bind it to C-d
let g:pymode_doc = 0
let g:pymode_doc_bind = '<C-d>'

"
" VIMUX Customization
"
" <Leader><CR> sends current line to tmux split
nnoremap <leader><CR> :call VimuxPromptCommand(getline('.')) <CR>

"
" FZF Customization
" Mapping selecting mappings
nnoremap <leader>j :FZF<CR>

" Map <leader>Enter to buffer search
function! s:buflist()
  redir => ls
  silent ls
  redir END
  return split(ls, '\n')
endfunction

function! s:bufopen(e)
  execute 'buffer' matchstr(a:e, '^[ 0-9]*')
endfunction

nnoremap <silent> <Leader>b :call fzf#run({
\   'source':  reverse(<sid>buflist()),
\   'sink':    function('<sid>bufopen'),
\   'options': '+m',
\   'down':    len(<sid>buflist()) + 2
\ })<CR>

"
" YouCompleteMe options
"
let g:ycm_server_python_interpreter = "/usr/bin/python"
let g:ycm_register_as_syntastic_checker = 1 "default 1
let g:ycm_show_diagnostics_ui = 1 "default 1

"will put icons in Vim's gutter on lines that have a diagnostic set.
"Turning this off will also turn off the YcmErrorLine and YcmWarningLine
"highlighting
let g:ycm_enable_diagnostic_signs = 1
let g:ycm_enable_diagnostic_highlighting = 0
let g:ycm_always_populate_location_list = 1 "default 0
let g:ycm_open_loclist_on_ycm_diags = 1 "default 1


let g:ycm_complete_in_strings = 1 "default 1
let g:ycm_collect_identifiers_from_tags_files = 0 "default 0
let g:ycm_path_to_python_interpreter = '' "default ''


let g:ycm_server_use_vim_stdout = 0 "default 0 (logging to console)
let g:ycm_server_log_level = 'info' "default info


let g:ycm_global_ycm_extra_conf = '~/.ycm_extra_conf.py'  "where to search for .ycm_extra_conf.py if not found
let g:ycm_confirm_extra_conf = 1


let g:ycm_goto_buffer_command = 'same-buffer' "[ 'same-buffer', 'horizontal-split', 'vertical-split', 'new-tab' ]
let g:ycm_filetype_whitelist = { '*': 1 }
let g:ycm_key_invoke_completion = '<C-Space>'

"nnoremap <F11> :YcmForceCompileAndDiagnostics <CR>

se t_Co=16
filetype plugin indent on
