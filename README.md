This is my dot vim configuration. To use this on a new PC. 

You should know that I change my settings like crazy and I break my installation very often. 

* Prerequisites : 
	* vim should have been built with python support (needed for some plugins).

* On Linux 
```shell
cd ~ && git clone git@github.com:sinarf/dotvim.git .vim && ln -sf .vim/vimrc .vimrc && ln -sf .vim/gvimrc .gvimrc && cd .vim && git submodule init && git submodule update
```

* On Windows  (needs groovy installed).
```shell
cd %USERDIR% 
git clone https://github.com/sinarf/dotvim.git vimfiles && cd vimfiles  && git submodule init && git submodule update
PutVimrcFilesInHome.groovy
```
