-- Global Variables
vim.g.better_whitespace_enabled=1
vim.g.strip_whitespace_on_save=1
vim.g.strip_whitespace_confirm=0
vim.g.NERDTrimTrailingWhitespace = 1

-- Leader
vim.g.mapleader = ' '
vim.b.mapleader = ' '

-- Global options
vim.o.hlsearch = false
vim.o.hidden = true
vim.o.mouse ='a'

-- Buffer options
vim.o.autoindent = true
vim.bo.autoindent = true
vim.o.tabstop = 4
vim.bo.tabstop = 4
vim.o.shiftwidth = vim.bo.tabstop
vim.bo.shiftwidth = vim.bo.tabstop
vim.o.softtabstop = vim.bo.tabstop
vim.bo.softtabstop = vim.bo.tabstop
vim.o.expandtab = true
vim.bo.expandtab = true
vim.o.swapfile = false
vim.bo.swapfile = false
vim.bo.formatoptions = 'tqjn'
vim.o.formatoptions = 'tqjn'

-- Window options
vim.wo.relativenumber = true
vim.wo.number = true
vim.wo.wrap = false
vim.wo.colorcolumn = '80'
