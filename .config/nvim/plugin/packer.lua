-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function()
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'

    -- LSP
    use 'neovim/nvim-lspconfig'
    use 'ms-jpq/coq_nvim'
    -- Snippets
    use 'SirVer/ultisnips'

    -- Git integration
    use 'tpope/vim-fugitive'

    -- Fuzzy finder
    use 'junegunn/fzf'
    use 'junegunn/fzf.vim'

    -- Code Display
    use 'morhetz/gruvbox'
    use 'joshdick/onedark.vim'
    use 'yggdroot/indentline'
    use 'ntpeters/vim-better-whitespace'
    use 'arcticicestudio/nord-vim'
    use 'octol/vim-cpp-enhanced-highlight'
    -- Note taking
    use 'lervag/vimtex'

    -- Airline
    use 'vim-airline/vim-airline'

    -- Code editing
    use 'preservim/nerdcommenter'

    -- Maximize windows
    use 'szw/vim-maximizer'
end)
