local opts = { noremap=true, silent=true }

vim.api.nvim_buf_set_keymap(0, 'n', '<F4>', ':e %:r.cpp<cr>', opts)
