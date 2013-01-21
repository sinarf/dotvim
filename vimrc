" sinarf vimrc 
" Use Vim settings, rather then Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

" change the leader key 
let mapleader = ","

" Enable pathogen
call pathogen#runtime_append_all_bundles()
call pathogen#helptags()

syntax on
filetype plugin indent on

" make mswin like copy paste source : http://superuser.com/questions/10588/how-to-make-cut-copy-paste-in-gvim-on-ubuntu-work-with-ctrlx-ctrlc-ctrlv
source $VIMRUNTIME/mswin.vim
behave mswin

" note plugin parameters 
let g:notes_directory = '~/Dropbox/notes'
let g:notes_suffix = '.txt'

set hidden

