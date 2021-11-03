local opts = {noremap = true, silent = true}

-- Maximizer
vim.api.nvim_set_keymap('n', '<leader>m', ':MaximizerToggle<cr>', opts)
