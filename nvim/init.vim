call plug#begin('~/.vim/plugged')
" LSP
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/nvim-cmp'

" Snippets
Plug 'SirVer/ultisnips'
Plug 'quangnguyen30192/cmp-nvim-ultisnips'

" Git integration
Plug 'tpope/vim-fugitive'

" Fuzzy finder
Plug 'junegunn/fzf', { 'do': {-> fzf#install() } }
Plug 'junegunn/fzf.vim'

" Code Display
Plug 'morhetz/gruvbox'
Plug 'yggdroot/indentline'
Plug 'ntpeters/vim-better-whitespace'

" Note taking
Plug 'lervag/vimtex'

" Airline
Plug 'vim-airline/vim-airline'

" Code editing
Plug 'preservim/nerdcommenter'

" Maximize windows
Plug 'szw/vim-maximizer'
call plug#end()

let g:vimtex_view_method = 'zathura'

let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"

autocmd FileType tex inoremap <buffer> <C-\> \(
autocmd FileType tex inoremap <buffer> <A-[> \[

lua require('config')
lua require('mappings')
colo gruvbox
