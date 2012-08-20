This is my dot vim configuration. To use this on a new PC 

* On Linux 
```
cd ~ && git clone git@github.com:sinarf/dotvim.git .vim && ln -sf .vim/vimrc .vimrc && ln -sf .vim/gvimrc .gvimrc && git submodule init && git submodule update
```
* On Windows  (needs groovy installed).
```
cd %USERDIR% 
git clone https://github.com:sinarf/dotvim.git vimfiles 
cd vimfiles
PutVimrcFilesInHome.groovy
```
