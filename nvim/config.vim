let mapleader = " "
set number
set nowrap
set noswapfile
set nohlsearch
set relativenumber
set smartcase
set ignorecase
set incsearch
set autoindent
set hidden


" Tab convert to space
set tabstop=4
set shiftwidth=4
set expandtab
set softtabstop=4

" Allow mouse use
set mouse=a

" Set color column
set cc=80

" This saves the file every 1 second
" autocmd TextChanged,TextChangedI <buffer> silent write

" ColorScheme
colo gruvbox
hi! Normal ctermbg=NONE guibg=NONE
hi! NonText ctermbg=NONE guibg=NONE guifg=NONE ctermfg=NONE

if exists('+termguicolors')
    let &t_8f = "\<Esc>[38;2%;%lu;%lu;%lum"
    let &t_8b = "\<Esc>[48;2%;%lu;%lu;%lum"
endif

" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1

" NerdTree
" Start NERDTree when Vim starts with a directory argument.
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists('s:std_in') |
    \ execute 'NERDTree' argv()[0] | wincmd p | enew | execute 'cd '.argv()[0] | endif

" Better whitespace
let g:better_whitespace_enabled=1
let g:strip_whitespace_on_save=1
let g:strip_whitespace_confirm=0

" Vimtex
g:vimtex_syntax_conceal_disable=1
