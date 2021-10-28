-- Global options
_G.better_whitespace_enabled=1
_G.strip_whitespace_on_save=1
_G.strip_whitespace_confirm=0
_G.NERDTrimTrailingWhitespace = 1
_G.vimtex_syntax_conceal_disable = 1
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '
vim.g.noswapfile = true
vim.g.nohlsearch = true
vim.g.hidden = true
vim.g.mouse = 'a'

-- Buffer options
vim.bo.autoindent = true
vim.bo.tabstop = 4
vim.bo.shiftwidth = vim.bo.tabstop
vim.bo.softtabstop = vim.bo.tabstop
vim.bo.expandtab = true

-- Window options
vim.wo.concealcursor = ''
vim.wo.relativenumber = true
vim.wo.number = true
vim.wo.wrap = false
vim.wo.colorcolumn = '80'

vim.cmd('colo gruvbox')

