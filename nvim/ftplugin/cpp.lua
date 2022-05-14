local opts = { noremap=true, silent=true }

vim.api.nvim_buf_set_keymap(0,'n','<F4>', ':e %:p:s,.h$,.X123X,:s,.cpp$,.h,:s,.X123X$,.cpp,<CR>',opts)
vim.api.nvim_buf_set_keymap(0, 'n', '<leader>br', ':make run<cr>', opts)
vim.api.nvim_buf_set_keymap(0, 'n', '<leader>bb', ':make build<cr>', opts)
vim.api.nvim_buf_set_keymap(0, 'n', '<leader>ba', ':make<cr>', opts)
