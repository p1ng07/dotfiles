call plug#begin('~/.vim/plugged')
" Autocomplete
Plug 'neoclide/coc.nvim' ,{'branch': 'release','do': 'yarn install --frozen-lockfile'}

" Git integration
Plug 'tpope/vim-fugitive'

" Fuzzy finder
Plug 'junegunn/fzf', { 'do': {-> fzf#install() } }
Plug 'junegunn/fzf.vim'

" Code Display
Plug 'morhetz/gruvbox'
Plug 'yggdroot/indentline'
Plug 'sheerun/vim-polyglot'
Plug 'ntpeters/vim-better-whitespace'

" Markdown
Plug 'plasticboy/vim-markdown'
Plug 'godlygeek/tabular'

" Project Explorer
Plug 'scrooloose/nerdtree'

" Airline
Plug 'vim-airline/vim-airline'

" Code editing
Plug 'preservim/nerdcommenter'

" Note taking
" Plug 'vimwiki/vimwiki'

" Maximize windows
Plug 'szw/vim-maximizer'

call plug#end()

source ~/.config/nvim/config.vim
source ~/.config/nvim/coc.vim
source ~/.config/nvim/mappings.vim
set conceallevel=0
set concealcursor=""
