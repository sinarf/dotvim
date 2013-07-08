
"##############################################################################
" FUNCTIONS: 
"##############################################################################
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
	exec ":silent !$BROWSER &".line
endfunction
map <F11> :call Browser()<CR>

if has('win32') || has('win64')
	set guifont=Consolas:h10
elseif has('unix')
	set guifont=Ubuntu\ Mono\ 12
endif
" colors I like
"colorscheme desert
" ------------------------------------------------------------------
" Solarized Colorscheme Config
" ------------------------------------------------------------------
colorscheme candyman
"colorscheme solarized
set background=dark
"set background=light
let g:solarized_termcolors=256    "default value is 16
let g:solarized_contrast="high"    "default value is normal
syntax enable
" ------------------------------------------------------------------

" The following items are available options, but do not need to be
" included in your .vimrc as they are currently set to their defaults.

" let g:solarized_termtrans=0
" let g:solarized_degrade=0
" let g:solarized_bold=1
" let g:solarized_underline=1
" let g:solarized_italic=1
" let g:solarized_diffmode="normal"
" let g:solarized_hitrail=0
" let g:solarized_menu=1

" Size of GVim window
set lines=50 columns=120
" Don't display the menu or toolbar. Just the screen.
set guioptions-=m
set guioptions-=T
set guioptions-=l
set guioptions-=r
set guioptions-=b

