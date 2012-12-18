" sinarf vimrc 
" created on April 29, 2011
" change the leader key 
let mapleader = ","

" Enable pathogen
call pathogen#runtime_append_all_bundles()
call pathogen#helptags()


" Use Vim settings, rather then Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible
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

" keyboard mapping / shortcut
" To save, ctrl-s.
nmap <c-s> :w<CR>
imap <c-s> <Esc>:w<CR>a
" make mswin like copy paste source : http://superuser.com/questions/10588/how-to-make-cut-copy-paste-in-gvim-on-ubuntu-work-with-ctrlx-ctrlc-ctrlv
source $VIMRUNTIME/mswin.vim
behave mswin

set wrap linebreak textwidth=0

" enable folding for my favorites languages 
autocmd BufNewFile,BufRead *.java set foldmethod=syntax

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

au BufNewFile,BufRead *.gradle setf groovy

let g:notes_directory = '~/Dropbox/notes'
let g:notes_suffix = '.txt'

" NERDTree openned by default
" autocmd vimenter * NERDTree

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
map \w :call Browser ()<CR>

set ffs=unix
set ff=unix

" format JSON
map <Leader>j :%!python -m json.tool<CR>

