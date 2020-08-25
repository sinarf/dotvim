::
             _                   __              _
         ___(_) _ _   __ _  _ _  / _|       __ __(_) _ __
        (_-/| || ' \ / _` || '_||  _|  _    \ V /| || '  \
        /__/|_||_||_|\__/_||_|  |_|   (_)    \_/ |_||_|_|_|

Introduction
============


This is my third reboot of my dotvim configuration. I had a bunch of stuff randomly pasted from various place, a big clean up. 

TODO
====

* [ ] setup Python dev
  * [X] 2020-08-25 Lint
  * [X] 2020-08-25 Code completion
  * [X] 2020-08-25 Test 
* [ ] Disable folding on rst files
* Setup bash dev
  * [o] Lint
  * [o] Code completion
  * [o] Test 

Prerequisites (might miss some stuff): 
=======================================


* The following software are needed:
    
    * git
    * curl
    * fzf
    * vim with Python support enable

Installation
============

* Clone this repo in .vim directory
* Run ``:PlugClean``
* Run ``:PlugInstall`
* Run ``:CocInstall coc-explorer coc-vimlsp coc-marketplace coc-snippets``

