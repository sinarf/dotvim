" vim signify configuration
let g:signify_vcs_list= ['git', 'svn']

" Fugitive mapping
nnoremap <leader>gst :Gstatus<CR>
nnoremap <leader>gco :Gcommit<CR>
nnoremap <leader>gca :Gcommit -a<CR>
nnoremap <leader>gpl :Gpull<CR>
nnoremap <leader>gps :Gpush<CR>
