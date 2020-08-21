" 
"         ___(_) _ _   __ _  _ _  / _|       __ __(_) _ __
"        (_-/| || ' \ / _` || '_||  _|  _    \ V /| || '  \
"        /__/|_||_||_|\__/_||_|  |_|   (_)    \_/ |_||_|_|_|

" Setting the .vim or vimfiles directory path. 
" I didn't find any existing variable to do this. 
if has('win64')
    let $VIMDIR = "$HOME/vimfiles"
else 
    let $VIMDIR = "$HOME/.vim"
endif

" source configuration files
source $VIMDIR/vimrc.conf.d/plug-config.vim
source $VIMDIR/vimrc.conf.d/global-settings.vim
source $VIMDIR/vimrc.conf.d/default-mapping.vim
source $VIMDIR/vimrc.conf.d/functions.vim
source $VIMDIR/vimrc.conf.d/coc.vim
source $VIMDIR/vimrc.conf.d/fzf.vim
source $VIMDIR/vimrc.conf.d/python-dev.vim
source $VIMDIR/vimrc.conf.d/scm.vim

" some stuff are not publicly availlable (like api keys)
source ~/Sync/config/vim/secretsauce.vim

" automaticaly source vimrc on edition
autocmd! BufWritePost .vimrc,vimrc,$HOME/.vim/* source $MYVIMRC

