This is my dot vim configuration.
========

*You should know that I change my settings like crazy and I break my installation very often.*

## Prerequisites : 
	* vim should have been built with python support (needed for some plugins).

## On Linux 
```shell
cd ~ && git clone git@github.com:sinarf/dotvim.git .vim && ln -sf .vim/vimrc .vimrc && ln -sf .vim/gvimrc .gvimrc && cd .vim && git submodule init && git submodule update
mkdir -p ~/.local/share/vim/{swap,backup,undo}
```

## On Windows  

```shell
cd %USERDIR% 
git clone https://github.com/sinarf/dotvim.git vimfiles && cd vimfiles  && git submodule init && git submodule update
mkdir -p ~/.local/share/vim/{swap,backup,undo}
```
Making the links under windows, *You need to run this as an administrator (use the runas functionnality)*

```
cd %USERDIR%
mklink /H .vimrc vimfiles\vimrc
mklink /H .gvimrc vimfiles\gvimrc
```
