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

" Vim wiki
"let g:vimwiki_list = [{'path': '~/Notas/',
            "\ 'syntax': 'markdown', 'ext': '.md'}]

" Better whitespace
let g:better_whitespace_enabled=1
let g:strip_whitespace_on_save=1
let g:strip_whitespace_confirm=0

" Markdown
let g:vim_markdown_math = 1
let g:vim_markdown_no_extensions_in_markdown = 1
let g:vim_markdown_autowrite = 1
let g:vim_markdown_conceal = 0
let g:tex_conceal = ""
let g:vim_markdown_math = 1
let g:vim_markdown_conceal_code_blocks = 0
set conceallevel=0
set concealcursor=""
let g:vim_markdown_folding_disabled = 1

