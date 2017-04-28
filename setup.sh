#!/bin/sh

# this scipt setup my vim configuration 
echo "symlink the spell directory to dropbox" 
cd ~/.vim
ln -sf ~/Dropbox/config/vim/spell
cd - 

echo "Creating the symbolic links..."
cd ~
ln -sfv .vim/vimrc .vimrc
ln -sfv .vim/vimrc .vimrc

echo "Creating files to put the swap, backup and undo vim files. (only if needed)"
mkdir -pv ~/.local/share/vim/swap
mkdir -pv ~/.local/share/vim/backup
mkdir -pv ~/.local/share/vim/undo
cd -

