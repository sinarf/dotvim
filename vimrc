" sinarf vimrc 
" Use Vim settings, rather then Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

" change the leader key 
let mapleader = ","

" Enable pathogen
call pathogen#runtime_append_all_bundles()
call pathogen#helptags()
