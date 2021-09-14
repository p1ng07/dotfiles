call plug#begin('~/.vim/plugged')
" Autocomplete
Plug 'neoclide/coc.nvim'
Plug 'lervag/vimtex'
Plug 'plasticboy/vim-markdown'

" Git integration
Plug 'tpope/vim-fugitive'

" Fuzzy finder
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }

" Powerline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Themes
Plug 'morhetz/gruvbox'
Plug 'tomasr/molokai'

" Project Explorer
Plug 'scrooloose/nerdtree'

" Code editing
Plug 'tpope/vim-surround'
Plug 'preservim/nerdcommenter'


call plug#end()

source ~/.config/nvim/config.vim
source ~/.config/nvim/coc.vim
source ~/.config/nvim/mappings.vim

