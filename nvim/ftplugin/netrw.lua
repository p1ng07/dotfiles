local opts = {silent = true}

-- Map esc
vim.api.nvim_buf_set_keymap(0,'n', 'h', '-', opts)
vim.api.nvim_buf_set_keymap(0,'n', 'l', '<cr>', opts)
