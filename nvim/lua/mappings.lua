local opts = {noremap = true, silent = true}

-- Map esc
vim.api.nvim_set_keymap('', '<C-c>', '<esc>', opts)
vim.api.nvim_set_keymap('i', 'uu', '<esc>', opts)

-- Insert line above and below
vim.api.nvim_set_keymap('n', '[o', 'O<ESC>j',opts)
vim.api.nvim_set_keymap('n', ']o', 'o<ESC>k',opts)

-- Center results of search
vim.api.nvim_set_keymap('n', 'n', 'nzz', opts)
vim.api.nvim_set_keymap('n', 'N', 'Nzz', opts)

-- Join lines without moving cursor
vim.api.nvim_set_keymap('n', 'J', 'mzJ`z', opts)

-- File manager
vim.api.nvim_set_keymap('n', '<leader>/', ':Ex<cr>', opts)

-- Yank to clipboard and void
vim.api.nvim_set_keymap('v', '<leader>y', '"+y', opts)
vim.api.nvim_set_keymap('n', '<leader>p', '"+p', opts)
vim.api.nvim_set_keymap('v', '<leader>p', '"+p', opts)
vim.api.nvim_set_keymap('n', '<leader>d', '"_dd', opts)
vim.api.nvim_set_keymap('v', '<leader>d', '"_d', opts)

-- QuickFix list jumping
vim.api.nvim_set_keymap('n', '<C-j>', ':cnext<cr>', opts)
vim.api.nvim_set_keymap('n', '<C-k>', ':cprevious<cr>', opts)

-- Jumplist remap
vim.api.nvim_set_keymap('n', '<C-h>', '<C-o>', opts)
vim.api.nvim_set_keymap('n', '<C-l>', '<C-i>', opts)

opts = {noremap = true, silent = true, nowait = true}

-- File saving
vim.api.nvim_set_keymap('n', '<leader>fs', ':w<cr>', opts)
vim.api.nvim_set_keymap('n', '<leader>fS', ':wa<cr>', opts)
-- Sourcing
vim.api.nvim_set_keymap('n', '<leader>fcc', ':so ~/.config/nvim/init.vim<cr>', opts)
