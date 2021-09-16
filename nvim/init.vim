call plug#begin('~/.vim/plugged')
" Autocomplete
Plug 'neoclide/coc.nvim'
Plug 'lervag/vimtex'
Plug 'plasticboy/vim-markdown'

" Git integration
Plug 'tpope/vim-fugitive'

" Fuzzy finder
Plug 'junegunn/fzf', { 'do': {-> fzf#install() } }
Plug 'junegunn/fzf.vim'

" Powerline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Code Display
Plug 'cocopon/iceberg.vim'
Plug 'yggdroot/indentline'
Plug 'sheerun/vim-polyglot'

" Project Explorer
Plug 'scrooloose/nerdtree'

" Code editing
Plug 'preservim/nerdcommenter'


call plug#end()

source ~/.config/nvim/config.vim
source ~/.config/nvim/coc.vim
source ~/.config/nvim/mappings.vim

