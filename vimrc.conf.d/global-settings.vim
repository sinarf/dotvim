"This file contains global config for vim 

" change the leader keys
let mapleader = " "
let maplocalleader = ","

" enable this for debug
"set verbose=9

set hidden
set number relativenumber
set cursorline
set tabstop=4
set shiftwidth=4
set expandtab
set mouse=a
set encoding=utf-8
" searching
set incsearch
set smartcase

" Make the clipboard work
set pastetoggle=<F2>
set clipboard=unnamed

" wrapping not cutting words in the middle: source : http://stackoverflow.com/questions/744159/word-wrap-in-gvim
set formatoptions=l
set lbr

" keep a backup of edited files
set backup
" make undos persistent 
set undofile

set spell
set spelllang=fr,en

if has('win32') || has('win64')
    set guifont=Cascadia\ Code:h12
elseif has('unix')
    set guifont=Cascadia\ Code:h18
endif


colorscheme gruvbox
set background=dark
