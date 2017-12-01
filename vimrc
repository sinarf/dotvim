" vim:fdm=marker
" sinarf vimrc
" Use Vim settings, rather then Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
" {{{ GENERAL OPTIONS
set nocompatible
" change the leader keys
let mapleader = ","
let maplocalleader = ";"


" {{{ dein CONFIG

if &compatible
	set nocompatible
endif
filetype off
" append to runtime path
set rtp+=/usr/share/vim/vimfiles
" initialize dein, plugins are installed to this directory
call dein#begin(expand('~/.cache/dein'))

"syntax plugins
call dein#add('PotatoesMaster/i3-vim-syntax')

" productivity
call dein#add('freitass/todo.txt-vim')
call dein#add('SirVer/ultisnips')
call dein#add('honza/vim-snippets')

" useability
call dein#add('bling/vim-airline')
call dein#add('edkolev/promptline.vim')
call dein#add('scrooloose/nerdtree')
call dein#add('scrooloose/nerdcommenter')
call dein#add('ctrlpvim/ctrlp.vim')
call dein#add('gioele/vim-autoswap')

" Dev tools
call dein#add('scrooloose/syntastic')
call dein#add('tpope/vim-fugitive')
call dein#add('jaxbot/github-issues.vim')
call dein#add('Chiel92/vim-autoformat')
call dein#add('editorconfig/editorconfig-vim')
call dein#add('Valloric/YouCompleteMe', {'build': './install.py --tern-completer'})
call dein#add('ternjs/tern_for_vim')
call dein#add('Raimondi/delimitMate')
call dein#add('mhinz/vim-signify')

" Language specific plugin 
" javascript
call dein#add('pangloss/vim-javascript')
" typescript 
call dein#add('leafgarland/typescript-vim')
call dein#add('Quramy/tsuquyomi')

" Writing
call dein#add('parkr/vim-jekyll')
call dein#add('vimwiki/vimwiki')
call dein#add('xolox/vim-notes')
" vim-notes dependency
call dein#add('xolox/vim-misc')

" eye candy
call dein#add('altercation/vim-colors-solarized')

" exit dein
call dein#end()
" auto-install missing packages on startup
if dein#check_install()
	call dein#install()
endif
filetype plugin on

" }}}
" ------------------------------------------------------------------
" Solarized Colorscheme Config
" ------------------------------------------------------------------
set background=dark
"set background=light
let g:solarized_termcolors=256    "default value is 16
let g:solarized_contrast="high"    "default value is normal

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
	" Windows workarounds: Once upon a time I was working with Windows.
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
" }}}
"##############################################################################
" {{{ FUNCTIONS:
"##############################################################################
" }}}
"##############################################################################
" {{{ MAPPING:
"##############################################################################
"easy edit of vim config file
nnoremap <leader>ev :e $VIMHOME/vimrc<CR>
nnoremap <leader>sv :source $HOME/.vimrc<CR>
nnoremap <leader>egv :e $VIMHOME/gvimrc<CR>

" Autoformat
nnoremap <leader>f :Autoformat<CR>

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

" evervim
nnoremap <leader>ec :EvervimCreateNote<CR>
nnoremap <leader>en :EvervimNotebookList<CR>
nnoremap <leader>et :EvervimListTags<CR>
" }}}
"###############################################################################
" {{{ AUTOCMD:
"###############################################################################

" autoformat on write
augroup autoformat
	autocmd!
	" All files 
	"au BufWrite * :Autoformat
	" Only certain files 
	au BufWrite *.ts,*.js,*.html,*.css,*.json :Autoformat<CR>
augroup END
augroup filetype_xml
	autocmd!
	autocmd FileType xml,xsd,wsdl nnoremap <buffer> <localleader>f :silent %!xmllint --format -<CR>gg=G''
augroup END
augroup filetype_vimwiki
	autocmd!
	autocmd FileType vimwiki nnoremap <buffer> <localleader>td ^a [ ] <ESC>
	autocmd FileType vimwiki nnoremap <leader>wf :VWS
	" make the file directory to be the current directory
	autocmd BufEnter *.wiki silent! lcd %:p:h
	autocmd BufRead,BufWritePre diary.wiki :VimwikiDiaryGenerateLinks
	autocmd Filetype vimwiki setlocal spell
	autocmd BufWritePost *.wiki :Vimwiki2HTML
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

augroup filetype_markdown
	autocmd!
	autocmd BufNewFile,BufRead *.md setf=markdown
	autocmd FileType markdown setlocal spell spelllang=en_us
augroup END
augroup fileype_txt
	autocmd!
	autocmd FileType text setlocal spell spelllang=fr
augroup END

" }}}
"##############################################################################
" {{{ ABBREVIATIONS:
"##############################################################################
iabbrev @@ michel@blavin.fr
iabbrev  #### ################################################################################<cr>#<cr>################################################################################
"}}}
"################################################################################
"# {{{ COMMANDS
"################################################################################
:command! -complete=file -nargs=1 Rpdf :r !pdftotext -nopgbrk <q-args> -
" }}}
"################################################################################
" {{{ PLUGIN CONFIGURATION:
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

" TODO check if this work or clean 
" pomodoro airline :
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
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
	set statusline+=%#warningmsg#
	set statusline+=%{SyntasticStatuslineFlag()}
	set statusline+=%{eclim#project#util#ProjectStatusLine()}
	set statusline+=%*
endif

"github issue open in the current window 
let g:github_same_window = 1
let g:gissues_async_omni = 1

" Easy motion plugin
let g:EasyMotion_leader_key = '<Leader>'

" added for groovy taglists source : www.objectpartners.com/2012/02/21/using-vim-as-your-grails-ide-part-1-navigating-your-project/
let s:tlist_def_groovy_settings = 'groovy;p:package;c:class;i:interface;' . 'f:function;v:variables'

" Calendar
let g:calendar_google_calendar = 1
let g:calendar_google_task = 1

" conoline autostart
let g:conoline_auto_enable = 1

" angular plugin
let g:angular_source_directory = 'src'
let g:angular_test_directory = 'test'

" eclim
let g:EclimProjectStatusLine = 'eclim(p=${name}, n=${natures})'

"enable keyboard shortcuts
let g:tern_map_keys=1
"show argument hints
let g:tern_show_argument_hints='on_hold'

" YouCompleteMe from the arch wiki
let g:EclimCompletionMethod = 'omnifunc'
" by default there no completion on gitcommit file but I want it for
" github-issues plugin 
let g:ycm_filetype_specific_completion_to_disable = { }
" manual mode ;)
let g:ycm_auto_trigger = 0
" using Ctrl+Space for completion
let g:ycm_key_invoke_completion = '<C-Space>'


" ctrlp configuration
" Use <leader>t to open ctrlp
let g:ctrlp_map = '<leader>t'
" Ignore these directories
let g:ctrlp_cmd = 'CtrlP'

" shortcut for mru 
nnoremap <leader>m :CtrlPMRUFiles<CR>

let g:ctrlp_working_path_mode = 'ra'
set wildignore+=*/build/**
set wildignore+=*/target/**
set wildignore+=*/bin/**
set wildignore+=*/tmp/*
set wildignore+=*so
set wildignore+=**.swp
set wildignore+=*.zip
set wildignore+=*/node_modules/*
set wildignore+=**/dist/*
let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|^.git$\|_site|target|bin|build'

" vim-notes
let g:notes_directories = [ '~/Dropbox/texts']
let g:notes_suffix = '.txt'

" UltiSnips
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" vim signify configuration
let g:signify_vcs_list= ['git']

" }}]
