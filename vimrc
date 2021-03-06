" 
"         ___(_) _ _   __ _  _ _  / _|       __ __(_) _ __
"        (_-/| || ' \ / _` || '_||  _|  _    \ V /| || '  \
"        /__/|_||_||_|\__/_||_|  |_|   (_)    \_/ |_||_|_|_|
"
"
" source configuration files
source $HOME/.vim/vimrc.conf.d/plug-config.vim
source $HOME/.vim/vimrc.conf.d/global-settings.vim
source $HOME/.vim/vimrc.conf.d/gui-settings.vim
source $HOME/.vim/vimrc.conf.d/default-mapping.vim
source $HOME/.vim/vimrc.conf.d/functions.vim
source $HOME/.vim/vimrc.conf.d/coc.vim
source $HOME/.vim/vimrc.conf.d/fzf.vim
source $HOME/.vim/vimrc.conf.d/python-dev.vim
source $HOME/.vim/vimrc.conf.d/scm.vim

" some stuff are not publicly availlable (like api keys)
source ~/Sync/config/vim/secretsauce.vim

" automaticaly source vimrc on edition
autocmd! BufWritePost .vimrc,vimrc,$HOME/.vim/* source $MYVIMRC

