local opts = {noremap = true, silent = true}
-- Fuzzy finder
vim.api.nvim_set_keymap('n', '<leader>.', ':Files<cr>', opts)
vim.api.nvim_set_keymap('n', '<leader>b', ':Buffers<cr>', opts)
vim.api.nvim_set_keymap('n', '<leader>r', ':Rg<cr>', opts)
