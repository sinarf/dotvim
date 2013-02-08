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
set tabstop=4
set shiftwidth=4
set smarttab
set ff=unix
set ffs=unix,dos

" Variable setup
if has('win32') || has ('win64')
	let $VIMHOME = $HOME."/vimfiles"
else
	let $VIMHOME = $HOME."/.vim"
endif

" set the vim directories, shamelessly stolen from sensible plugin.  
let s:dir = '~/.local/share/vim'
if isdirectory(expand(s:dir))
	if &directory =~# '^\.,'
		let &directory = expand(s:dir) . '/swap//,' . &directory
	endif
	if &backupdir =~# '^\.,'
		let &backupdir = expand(s:dir) . '/backup//,' . &backupdir
	endif
	if exists('+undodir') && &undodir =~# '^\.\%(,\|$\)'
		let &undodir = expand(s:dir) . '/undo//,' . &undodir
	endif
endif

"##############################################################################
" FUNCTIONS: 
"##############################################################################

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
iabbrev @@ michel@blavin.fr
iabbrev @@@ michel.blavin@vif.fr
iabbrev  #### ################################################################################<cr>#<cr>################################################################################

"###############################################################################
" AUTOCMD:
"############################################################################### 
" format the xml html and so on before writing it to the disk
augroup bufWritePre
	autocmd!
	autocmd BufWritePre *.xml,*.html,*.xsl,*.wsdl :normal gg=G
augroup END
augroup filetype_xml
	autocmd!
	autocmd FileType xml nnoremap <buffer> <localleader>f :silent %!xmllint --format -<CR>gg=G
augroup END
"################################################################################
" PLUGIN CONFIGURATION: 
"################################################################################ 
let g:SimplenoteFiletype="markdown"
