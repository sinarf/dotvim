" sinarf vimrc 
" Use Vim settings, rather then Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

" created on April 29, 2011
" change the leader key 
let mapleader = ","

" Enable pathogen
call pathogen#runtime_append_all_bundles()
call pathogen#helptags()


" Enable syntax highlighting.
syntax on
" tab size 4
set tabstop=4
set shiftwidth=4
" Automatically indent when adding a curly bracket, etc.
set smartindent
" Use UTF-8 from http://vim.wikia.com/wiki/Working_with_Unicode
if has("multi_byte")
  if &termencoding == ""
    let &termencoding = &encoding
  endif
  set encoding=utf-8
  setglobal fileencoding=utf-8
  "setglobal bomb
  set fileencodings=ucs-bom,utf-8,latin1
endif

" Search as you type.
set incsearch
" smart case when searching.
set smartcase
" Show autocomplete menus.
set wildmenu
" Show autocomplete menus.
set wildmenu
" enable the filetype plugins
filetype plugin on
" Font. Very important.
if has('win32') || has('win64')
	set guifont=Consolas:h12
elseif has('unix')
	set guifont=Ubuntu\ Mono\ 14
endif

" make mswin like copy paste source : http://superuser.com/questions/10588/how-to-make-cut-copy-paste-in-gvim-on-ubuntu-work-with-ctrlx-ctrlc-ctrlv
source $VIMRUNTIME/mswin.vim
behave mswin

set wrap linebreak textwidth=0

" enable folding for my favorites languages 
autocmd BufNewFile,BufRead *.java set foldmethod=syntax
autocmd BufNewFile,BufRead *.javajet set filetype=java

set number

" Show invisible characters. 
" Use the same symbols as TextMate for tabstops and EOLs
" set listchars=tab:▸\ ,eol:¬
" set list
"Invisible character colors
" highlight NonText guifg=#4a4a59
" highlight SpecialKey guifg=#4a4a59

" Bubble single lines
nmap <A-Up> [e
nmap <A-Down> ]e
" Bubble multiple lines
vmap <A-Up> [egv
vmap <A-Down> ]egv

" indentation 
nmap <D-[> <<
nmap <D-]> >>
vmap <D-[> <gv
vmap <D-]> >gv

set hidden

" json 
au! BufRead,BufNewFile *.json set filetype=json
augroup json_autocmd
  autocmd!
  autocmd FileType json set autoindent
  autocmd FileType json set formatoptions=tcq2l
  autocmd FileType json set textwidth=78 shiftwidth=2
  autocmd FileType json set softtabstop=2 tabstop=8
  autocmd FileType json set expandtab
  autocmd FileType json set foldmethod=syntax
augroup END 

au BufNewFile,BufRead *.gradle set groovy

" just press F7 to format the stuff.
map <F7> mzgg=G`z<CR>
colorscheme desert

" TODO make this active only for x* files
map <F8> <ESC>:silent %!xmllint --format -<CR>

function! Browser ()
  let line0 = getline (".")
  let line = matchstr (line0, "http[^ ]*")
  :if line==""
  let line = matchstr (line0, "ftp[^ ]*")
  :endif
  :if line==""
  let line = matchstr (line0, "file[^ ]*")
  :endif
  " echo line
  exec ":silent !mozilla ".line
endfunction
map <Leader>w :call Browser ()<CR>

function! CleanEOL ()
	:%s/\r\(\n\)/\1/g<CR>
endfunction 
map <Leader>e <ESC>:%s/\r\(\n\)/\1/g<CR>

set ffs=unix
set ff=unix

" format JSON
map <Leader>j :%!python -m json.tool<CR>
" note plugin parameter 
let g:notes_directory = '~/Dropbox/notes'
let g:notes_suffix = '.txt'
" The note renaming doesn't seems to work on windows, it deletes the notes. 
" I need for this configuration to work under windows and linux. 
if has('win32') || has('win64')
	let g:notes_title_sync='no'
endif

" Windows Management 
" I also like to bind Ctrl+<movement> keys to move around the windows, instead
" of using Ctrl+w + <movement>:
map <c-j> <c-w>j
map <c-k> <c-w>k
map <c-l> <c-w>l
map <c-h> <c-w>h
map <leader>td <Plug>TaskList
" Python flakes 
let g:pyflakes_use_quickfix = 0
" Pythom completion
au FileType python set omnifunc=pythoncomplete#Complete
let g:SuperTabDefaultCompletionType = "context"
set completeopt=menuone,longest,preview
" code navigation 
map <leader>j :RopeGotoDefinition<CR>
map <leader>r :RopeRename<CR>
" fuzzy code search
nmap <leader>a <Esc>:Ack!
" Python testing with py.test
" Execute the tests
nmap <silent><Leader>tf <Esc>:Pytest file<CR>
nmap <silent><Leader>tc <Esc>:Pytest class<CR>
nmap <silent><Leader>tm <Esc>:Pytest method<CR>
" cycle through test errors
nmap <silent><Leader>tn <Esc>:Pytest next<CR>
nmap <silent><Leader>tp <Esc>:Pytest previous<CR>
nmap <silent><Leader>te <Esc>:Pytest error<CR>

"status line 
set statusline=%F%m%r%h%w\ %{&ff}\ [%Y]\ [\%03.3b]\ [%04l,%04v][%p%%-%L]\ %{fugitive#statusline()}

