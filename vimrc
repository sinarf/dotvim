" change the leader keys
let mapleader = " "
let maplocalleader = ","

" enable this for debug
"set verbose=9


set hidden
set number relativenumber
set cursorline
set tabstop=4
set shiftwidth=4
set expandtab
set mouse=a
set encoding=utf-8
" searching
set incsearch
set smartcase

" Make the clipboard work
set pastetoggle=<F2>
set clipboard=unnamed

" wrapping not cutting words in the middle: source : http://stackoverflow.com/questions/744159/word-wrap-in-gvim
set formatoptions=l
set lbr

" Set the directory where the plugin will be installed
call plug#begin('~/.cache/vim/plugged')

" Sensible settings from tpope.
Plug 'tpope/vim-sensible'

" LifeHacks
Plug 'mhinz/vim-startify'

" fuzzy finder
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" SCM
Plug 'tpope/vim-fugitive'
Plug 'mhinz/vim-signify'
Plug 'mattn/vim-gist'
Plug 'mattn/webapi-vim' " needed for vim-gist

" syntax file
Plug 'PotatoesMaster/i3-vim-syntax'
Plug 'thanethomson/vim-jenkinsfile'
Plug 'cespare/vim-toml'

" Developpement
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'Chiel92/vim-autoformat'
Plug 'preservim/nerdcommenter'
Plug 'wayhome/riv.vim'

" Python
Plug 'vim-scripts/indentpython.vim'
Plug 'nvie/vim-flake8' " PEP8 checking
Plug 'python-rope/ropevim' " refactoring
Plug 'alfredodeza/pytest.vim' " test

" Eye candy
Plug 'morhetz/gruvbox'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

call plug#end()


if has('win32') || has('win64')
    set guifont=Cascadia\ Code:h12
elseif has('unix')
    set guifont=Cascadia\ Code:h18
endif

" central place for vim working files
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
" keep a backup of edited files
set backup
" make undos persistent 
set undofile

" automaticaly source vimrc on edition
autocmd! BufWritePost .vimrc,vimrc source %

" some stuff are not publicly availlabli
source ~/Sync/config/vim/secretsauce.vim

colorscheme gruvbox
set background=dark

" Windows navigation
set splitright splitbelow
nnoremap <leader>j <C-W><C-J>
nnoremap <leader>k <C-W><C-K>
nnoremap <leader>l <C-W><C-L>
nnoremap <leader>h <C-W><C-H>
nnoremap ww <C-w>

" keymaping to edit this file.
nnoremap <leader>ev :e $MYVIMRC<CR>
" mapping for source this (the current file)
nnoremap <leader>st :source %<CR>


" switch to the directory of the current file
nnoremap <leader>cd :cd %:p:h<CR>

" Autoformat access everywhere
nnoremap <leader>a :Autoformat<CR>

"Simple scripts runner
nnoremap <leader>r :w<CR>:terminal %<CR>

" Swich spelllang
nnoremap <leader>se :set spelllang=en<CR>
nnoremap <leader>sf :set spelllang=fr<CR>

"  markdown plugin :
let g:vim_markdown_folding_disabled = 1
augroup filetype_markdown
    autocmd!
    autocmd BufNewFile,BufRead *.md,*.markdown setf=markdown
    autocmd FileType markdown setlocal spelllang=en_us
    au FocusLost * silent! wa
augroup END

augroup filetype_python
    autocmd!
    autocmd BufWritePost *.py call flake8#Flake8()
    autocmd BufWritePost *.py Pytest project
    autocmd BufWritePre *.py %s/\s\+$//e
augroup END

" autoformat on write
augroup autoformat
    autocmd!
    " All files
    "au BufWrite * :Autoformat
    " Only certain files
    au BufWrite *.ts,*.js,*.html,*.css,*.json :Autoformat<CR>
augroup END

" vim signify configuration
let g:signify_vcs_list= ['git', 'svn']

"  markdown plugin :
let g:vim_markdown_folding_disabled = 1

"
" COC configuration
"
" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
            \ pumvisible() ? "\<C-n>" :
            \ <SID>check_back_space() ? "\<TAB>" :
            \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

"Rope
let ropevim_vim_completion=1
let ropevim_extended_complete=1
"flake8
let g:flake8_show_in_gutter=1
"let g:flake8_show_in_file=1

" Fugitive mapping
nnoremap <leader>gst :Gstatus<CR>
nnoremap <leader>gco :Gcommit<CR>
nnoremap <leader>gca :Gcommit -a<CR>
nnoremap <leader>gpl :Gpull<CR>
nnoremap <leader>gps :Gpush<CR>

" fzf mapping
" find files
nnoremap <leader>ff :Files<CR>
" find file in git
nnoremap <leader>fg :GFiles<CR>
" MRU
nnoremap <leader>fh :History<CR>
" Find in files
nnoremap <leader>fi :Rg<CR>

" Historique des commandes
nnoremap <leader>ch :History:<CR>

nnoremap <leader>bl :Buffers<CR>
nnoremap <leader>wl :Windows<CR>

" Empty value to disable preview window altogether
let g:fzf_preview_window = ''

" Option for gvim 
if has('gui_running')
    " Size of GVim window
    set lines=50 columns=120
    " Don't display the menu or toolbar. Just the screen.
    " set guioptions-=m
    set guioptions-=T
endif
