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

-- Jumplist remap
vim.api.nvim_set_keymap('n', '<C-h>', '<C-o>', opts)
vim.api.nvim_set_keymap('n', '<C-l>', '<C-i>', opts)

opts = {noremap = true, silent = true, nowait = true}

-- File saving
vim.api.nvim_set_keymap('n', '<leader>s', ':w<cr>', opts)
vim.api.nvim_set_keymap('n', '<leader>S', ':wa<cr>', opts)
-- Sourcing
vim.api.nvim_set_keymap('n', '<leader>fcc', ':luafile /home/endbox/.config/nvim/init.lua<cr>', opts)

-- Spell checkcing
vim.api.nvim_set_keymap('n', '<F11>', ':set spell!<cr>', opts)
vim.api.nvim_set_keymap('i', '<F11>', '<C-o>:set spell!<cr>', opts)
