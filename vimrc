" sinarf vimrc 
" Use Vim settings, rather then Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

" change the leader keys 
let mapleader = ","
let maplocalleader = ";"

" Enable pathogen
call pathogen#runtime_append_all_bundles()
call pathogen#helptags()

syntax on
filetype plugin indent on

" make mswin like copy paste source : http://superuser.com/questions/10588/how-to-make-cut-copy-paste-in-gvim-on-ubuntu-work-with-ctrlx-ctrlc-ctrlv
source $VIMRUNTIME/mswin.vim
behave mswin

" some stuff are not publicly availlable
source ~/Dropbox/config/vim/secretsauce.vim

" note plugin parameters 
let g:notes_directory = '~/Dropbox/notes'
let g:notes_suffix = '.txt'

set hidden
set ignorecase
set smartcase

" Variable setup
if has('win32') || has ('win64')
    let $VIMHOME = $HOME."/vimfiles"
else
    let $VIMHOME = $HOME."/.vim"
endif


"##############################################################################
" FUNCTIONS: 
"##############################################################################
"
" XML tools 
" TODO make this active only for x* files
map <F8> <ESC>:silent %!xmllint --format -<CR>


"##############################################################################
" MAPPING: 
"##############################################################################
"easy edit of vim config file
nnoremap <leader>ev :e $VIMHOME/vimrc<CR>
nnoremap <leader>sv :source $VIMHOME/vimrc<CR>
nnoremap <leader>egv :e $VIMHOME/gvimrc<CR>

"##############################################################################
" ABBREVIATIONS: 
"##############################################################################
iabbrev @me michel@blavin.fr
iabbrev @vif michel.blavin@vif.fr

