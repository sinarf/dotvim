This is my dot vim configuration.
========

*You should know that I change my settings like crazy and I break my installation very often.*

*I am currently switching to neovim*. My neovim files can be found at : https://framagit.org/sinarf/dotneovim

## Prerequisites : 
	* vim should have been built with python support (needed for some plugins).
	* dein bundle manager should be installed see: https://github.com/Shougo/dein.vim

## On Linux 
```shell
cd ~ && git clone git@github.com:sinarf/dotvim.git .vim && ln -sf .vim/vimrc .vimrc && ln -sf .vim/gvimrc .gvimrc 
curl https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh > /tmp/dein_installer.sh && sh /tmp/dein_installer.sh ~/.cache/dein
mkdir -p ~/.local/share/vim/{swap,backup,undo}
```

## On Windows  (Not tested for a long time might be broken)

```shell
cd %USERDIR% 
git clone git@github.com:sinarf/dotvim.git vimfiles && cd vimfiles 
mkdir -p ~/.local/share/vim/{swap,backup,undo}
```
Making the links under windows : (doesn't work with cygwin, you should run this in windows console). 
```
cd %USERDIR%
mklink  .vimrc vimfiles\vimrc
mklink  .gvimrc vimfiles\gvimrc
```
