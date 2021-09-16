let mapleader = " "
set number	
set hlsearch	
set smartcase	
set ignorecase	
set incsearch	
 
set autoindent	

" Tab convert to space
set tabstop=4
set shiftwidth=4
set expandtab
set softtabstop=4	

" Allow mouse use
set mouse=a

" This saves the file every 1 second
autocmd TextChanged,TextChangedI <buffer> silent write

" ColorScheme
colo iceberg

" Powerline
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_idx_mode = 1

" NerdTree
" Start NERDTree when Vim starts with a directory argument.
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists('s:std_in') |
    \ execute 'NERDTree' argv()[0] | wincmd p | enew | execute 'cd '.argv()[0] | endif

" Vim Fugitive
