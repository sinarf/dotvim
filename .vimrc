" sinarf vimrc 
" created on April 29, 2011

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
" Use UTF-8
set encoding=utf-8
" Search as you type.
set incsearch
" Ignore case when searching.
set ignorecase
" Show autocomplete menus.
set wildmenu
" Show autocomplete menus.
set wildmenu
" enable the filetype plugins
filetype plugin on
" Don't display the menu or toolbar. Just the screen.
"set guioptions-=m
set guioptions-=T
set guioptions-=r
" Font. Very important.
if has('win32') || has('win64')
    set guifont=Consolas:h10:cANSI
elseif has('unix')
	let &guifont="Ubuntu Mono 10"
endif

" keyboard mapping / shortcut
" To save, ctrl-s.
nmap <c-s> :w<CR>
imap <c-s> <Esc>:w<CR>a
" make mswin like copy paste source : http://superuser.com/questions/10588/how-to-make-cut-copy-paste-in-gvim-on-ubuntu-work-with-ctrlx-ctrlc-ctrlv
source $VIMRUNTIME/mswin.vim
behave mswin

au BufRead,BufNewFile *.viki set filetype=viki
set wrap linebreak textwidth=0

" enable folding for my favorites languages 
autocmd BufNewFile,BufRead *.java set foldmethod=syntax

set number
" Use the same symbols as TextMate for tabstops and EOLs
set listchars=tab:▸\ ,eol:¬
set list

" Bubble single lines
nmap <C-Up> [e
nmap <C-Down> ]e
" Bubble multiple lines
vmap <C-Up> [egv
vmap <C-Down> ]egv

" indentation 
nmap <D-[> <<
nmap <D-]> >>
vmap <D-[> <gv
vmap <D-]> >gv

function! DoPrettyXML()
	" save the filetype so we can restore it later
	 let l:origft = &ft
	 set ft=
	" delete the xml header if it exists. This will
	" permit us to surround the document with fake tags
	" without creating invalid xml.
	1s/<?xml .*?>//e
	" insert fake tags around the entire document.
	" This will permit us to pretty-format excerpts of
	" XML that may contain multiple top-level elements.
	0put ='<PrettyXML>'
	$put ='</PrettyXML>'
	silent %!xmllint --format -
	" xmllint will insert an <?xml?> header. it's
	easy enough to delete
	" if you don't want it.
	" delete the fake tags
	2d
	$d
	" restore the 'normal' indentation,
	which is one extra level
	" too deep due to the extra tags we
	wrapped around the document.
	silent %<
	" back to home
	1
	 " restore the filetype
	exe "set ft=" . l:origft
endfunction
command! PrettyXML call

set hidden
