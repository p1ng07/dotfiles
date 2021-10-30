-- Global options
vim.g.better_whitespace_enabled=1
vim.g.strip_whitespace_on_save=1
vim.g.strip_whitespace_confirm=0
vim.g.NERDTrimTrailingWhitespace = 1

vim.g.mapleader = ' '
vim.g.hlsearch = false
vim.o.mouse ='a'

-- Buffer options
vim.bo.autoindent = true
vim.bo.tabstop = 4
vim.bo.shiftwidth = vim.bo.tabstop
vim.bo.softtabstop = vim.bo.tabstop
vim.bo.expandtab = true

-- Window options
vim.wo.relativenumber = true
vim.wo.number = true
vim.wo.wrap = false
vim.wo.colorcolumn = '80'
