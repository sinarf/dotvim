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

colorscheme desert

syntax on
filetype plugin indent on

" make mswin like copy paste source : http://superuser.com/questions/10588/how-to-make-cut-copy-paste-in-gvim-on-ubuntu-work-with-ctrlx-ctrlc-ctrlv
source $VIMRUNTIME/mswin.vim
behave mswin

" some stuff are not publicly availlable
source ~/Dropbox/config/vim/secretsauce.vim

" note plugin parameters 
let g:notes_suffix = '.txt'

set hidden
set ignorecase
set smartcase
set tabstop=4
set shiftwidth=4
set smarttab
set ff=unix
set ffs=unix,dos
set encoding=utf-8 
set fileencoding=utf-8
set number
" wrapping not cutting words in the middle: source : http://stackoverflow.com/questions/744159/word-wrap-in-gvim 
set formatoptions=l
set lbr

" Variable setup
if has('win32') || has ('win64')
	" Windows workarounds: until my work machine is under linux.
	let $VIMHOME = $HOME."/vimfiles"
	let g:notes_directory = '~\\Dropbox\\notes\\'
	" use cygwin as shell 
	set shell=C:\Cygwin\bin\bash.exe\ -login
	set shellcmdflag=-c
	set shellquote=\"
else
	let $VIMHOME = $HOME."/.vim"
	let g:notes_directory = '~/Dropbox/notes/'
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
nnoremap <leader>sv :source $HOME/.vimrc<CR>
nnoremap <leader>egv :e $VIMHOME/gvimrc<CR>
" swith to the more used filetypes
nnoremap <leader>tx :set filetype=xml<CR>
nnoremap <leader>tm :set filetype=markdown<CR>
" insert today timestamp	
nnoremap <leader>dt "=strftime("%Y-%m-%d")<CR>P
" running the current script 
nnoremap <leader>rt	:! %<CR>

" Simplenote mapping 
nnoremap <leader>sl :Simplenote -l<CR> 
"##############################################################################
" ABBREVIATIONS: 
"##############################################################################
iabbrev @@ michel@blavin.fr
iabbrev @@@ michel.blavin@vif.fr
iabbrev  #### ################################################################################<cr>#<cr>################################################################################

"################################################################################
"# COMMANDS
"################################################################################
:command! -complete=file -nargs=1 Rpdf :r !pdftotext -nopgbrk <q-args> -
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
augroup filetype_todotxt
	autocmd!
	autocmd FileType todotxt nnoremap <buffer> <localleader>td :TodoDone<CR>
	autocmd FileType todotxt nnoremap <buffer> <localleader>tc :TodoCancelled<CR>
	"prioritize 
	autocmd FileType todotxt nnoremap <buffer> <localleader>pa ^i(A) <ESC> 
	autocmd FileType todotxt nnoremap <buffer> <localleader>pb ^i(B) <ESC> 
	autocmd FileType todotxt nnoremap <buffer> <localleader>pc ^i(C) <ESC> 
	autocmd FileType todotxt nnoremap <buffer> <localleader>pd ^i(D) <ESC> 
	autocmd FileType todotxt nnoremap <buffer> <localleader>pe ^i(E) <ESC> 
	" context
	autocmd FileType todotxt nnoremap <buffer> <localleader>ch $a @home<ESC> 
	autocmd FileType todotxt nnoremap <buffer> <localleader>cw $a @work<ESC> 
augroup END
augroup filetype_notes
	autocmd!
	autocmd FileType notes nnoremap <buffer> <localleader>d :s/TODO/DONE/
	autocmd FileType notes nnoremap <buffer> <localleader>u :s/DONE/TODO/
augroup END
augroup filetype_markdown 
	autocmd!
	autocmd BufNewFile,BufRead *.md set filetype=markdown
augroup END

"################################################################################
" PLUGIN CONFIGURATION: 
"################################################################################ 
" Simplenote
let g:SimplenoteFiletype="markdown"

" unimpaired - Line bubbling.
" using the same shortcut as in eclipse. 
" Bubble single lines
nmap <A-Up> [e
nmap <A-Down> ]e
" Bubble multiple lines
vmap <A-Up> [egv
vmap <A-Down> ]egv
" Same but "à la vim" ...
" Bubble single lines
nmap <A-k> [e
nmap <A-j> ]e
" Bubble multiple lines
vmap <A-k> [egv
vmap <A-j> ]egv

" Powerline. Installed patched ubuntu font from https://github.com/pdf/ubuntu-mono-powerline-ttf
set rtp+=/usr/local/lib/python2.7/dist-packages/Powerline-beta-py2.7.egg/powerline/bindings/vim/
set laststatus=2
let g:Powerline_symbols = 'fancy'

" Notes 
nnoremap <leader>nn :Note 
nnoremap <leader>ns :SearchNotes  

" vim wiki
let g:vimwiki_list = [{'path': '~/Dropbox/wiki/'}]
