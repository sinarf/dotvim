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

colorscheme default
"colorscheme vividchalk
set background=dark

syntax on
filetype plugin indent on

" make mswin like copy paste source : http://superuser.com/questions/10588/how-to-make-cut-copy-paste-in-gvim-on-ubuntu-work-with-ctrlx-ctrlc-ctrlv
source $VIMRUNTIME/mswin.vim
behave mswin

" some stuff are not publicly availlable
source ~/Dropbox/config/vim/secretsauce.vim

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
set foldenable  
" wrapping not cutting words in the middle: source : http://stackoverflow.com/questions/744159/word-wrap-in-gvim 
set formatoptions=l
set lbr

" Variable setup
if has('win32') || has ('win64')
	" Windows workarounds: until my work machine is under linux.
	let $VIMHOME = $HOME."/vimfiles"
	" use cygwin as shell 
	"  mbl - disable the use of cygwin. 
	set shell=C:\cygwin\bin\bash.exe\ -login
	set shellcmdflag=-c
	set shellquote=\"
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
nnoremap <leader>sv :source $HOME/.vimrc<CR>
nnoremap <leader>egv :e $VIMHOME/gvimrc<CR>
" swith to the more used filetypes
nnoremap <leader>tx :set filetype=xml<CR>
nnoremap <leader>tm :set filetype=markdown<CR>
" insert today date	
nnoremap <leader>dt "=strftime("%Y-%m-%d")<CR>P
nnoremap <leader>df "=strftime("%A %d %B %Y")<CR>P
nnoremap <leader>dn "=strftime("%Y-%m-%d")<CR>P
" running the current script 
nnoremap <leader>rt	:! %<CR>

" NERDTree 
map <F2> <Esc>:NERDTreeToggle<CR> "Toggle the file browser
map <A-F1> <Esc>:NERDTreeFind<CR> "Find the current file in the file browser


nnoremap <leader>dn "=strftime("%Y-%m-%d")<CR>P
" running the current script 
nnoremap <leader>rt	:! %<CR>

" indent file 
nnoremap <leader>i	gg=G

" spell checking 
nnoremap <silent> <leader>s :set spell!<CR>
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
augroup filetype_xml
	autocmd!
	autocmd FileType xml nnoremap <buffer> <localleader>f :silent %!xmllint --format -<CR>gg=G''
augroup END
augroup filetype_todotxt
	autocmd!
	autocmd BufEnter todo.txt :set ft=todotxt
	autocmd FileType todotxt nnoremap <buffer> <localleader>d :TodoDone<CR>
	autocmd FileType todotxt nnoremap <buffer> <localleader>c :TodoCancelled<CR>
	"prioritize 
	autocmd FileType todotxt nnoremap <buffer> <localleader>pa ^i(A) <ESC> 
	autocmd FileType todotxt nnoremap <buffer> <localleader>pb ^i(B) <ESC> 
	autocmd FileType todotxt nnoremap <buffer> <localleader>pc ^i(C) <ESC> 
	autocmd FileType todotxt nnoremap <buffer> <localleader>pd ^i(D) <ESC> 
	autocmd FileType todotxt nnoremap <buffer> <localleader>pe ^i(E) <ESC> 
	" context
	autocmd FileType todotxt nnoremap <buffer> <localleader>ho ^i@home <ESC> 
	autocmd FileType todotxt nnoremap <buffer> <localleader>wk ^i@work <ESC> 
	autocmd FileType todotxt nnoremap <buffer> <localleader>wo ^i@waitingOn <ESC>
	autocmd FileType todotxt nnoremap <buffer> <localleader>ca ^i@call <ESC>
	autocmd FileType todotxt nnoremap <buffer> <localleader>on ^i@online <ESC>
augroup END
augroup filetype_markdown 
	autocmd!
	autocmd BufNewFile,BufRead *.md set filetype=markdown
augroup END
augroup filetype_vimwiki 
	autocmd!
	autocmd FileType vimwiki nnoremap <buffer> <localleader>td ^a [ ] <ESC>
	autocmd FileType vimwiki nnoremap <leader>wf :VWS 
	" make the file directory to be the current directory
	autocmd BufEnter *.wiki silent! lcd %:p:h 
	"autocmd BufWritePost *.wiki :VimwikiAll2HTML
	autocmd BufRead,BufWritePre diary.wiki :VimwikiDiaryGenerateLinks
	autocmd Filetype vimwiki setlocal spell
augroup END

augroup filetype_gitcommit 
	autocmd!
	autocmd Filetype gitcommit setlocal spell textwidth=72
augroup END

augroup filetype_groovy
	autocmd!
	au BufNewFile,BufRead *.gradle setf groovy
augroup END

augroup filetype_dosbatch
	autocmd!
	" use cmd as shell instead of cygwin -- won't work on non windows, but
	" who would be crazy enoough to develop dosbatch script if your are not
	" under windows. 
	autocmd FileType dosbatch :set shell=cmd 
augroup END
augroup filetype_javascript
	autocmd!
	autocmd FileType javascript,json  set tabstop=2
	autocmd FileType javascript,json  set shiftwidth=2
	autocmd FileType javascript,json  set expandtab
	autocmd FileType javascript,json nnoremap <buffer> <localleader>f :%!python -m json.tool<CR>
augroup END
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

"################################################################################
" PLUGIN CONFIGURATION: 
"################################################################################ 

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


" pomodoro airline :
let g:tomato#remind = "☻" 
let g:tomato#restinfo = "☺"

" vim wiki
let g:vimwiki_list = [{'path': '~/Dropbox/wiki/'}]
let g:vimwiki_folding = 1

if has('statusline')
	set laststatus=2
	"" Broken down into easily includeable segmentd
	set statusline=%<%f\   " Filename
	set statusline+=%w%h%m%r " Options
	set statusline+=%{fugitive#statusline()} "  Git Hotness
	set statusline+=\ [%{&ff}/%Y]            " filetype
	set statusline+=\ [%{getcwd()}]          " current dir
	set statusline+=\ [A=\%03.3b/H=\%02.2B] " ASCII / Hexadecimal value of char
	set statusline+=%=%-14.(%l,%c%V%)\ %p%%  " Right aligned file nav info
	"set statusline=%k%F[%{&ff}:%{&fenc}]%m%r%h%w\ %{strftime(\"%d/%m/%y\ -\ %H:%M\")}\ %=[%{GitBranch()}]\ %=[%l,%c,%p%%]
	set statusline+=\ %=[%{GitBranch()}]
	set statusline+=%#warningmsg#
	set statusline+=%{SyntasticStatuslineFlag()}
	set statusline+=%*
endif

" Easy motion plugin 
let g:EasyMotion_leader_key = '<Leader>'

" added for groovy taglists source : www.objectpartners.com/2012/02/21/using-vim-as-your-grails-ide-part-1-navigating-your-project/ 
let s:tlist_def_groovy_settings = 'groovy;p:package;c:class;i:interface;' . 'f:function;v:variables'

" Calendar 
let g:calendar_google_calendar = 1
let g:calendar_google_task = 1
