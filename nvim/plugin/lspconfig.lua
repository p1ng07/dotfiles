local lsp = require('lspconfig')
--local cmp = require('cmp')

--cmp.setup({
    --snippet = {
        ---- REQUIRED - you must specify a snippet engine
        --expand = function(args)
            ----vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
            ---- require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
            --vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
            ---- require'snippy'.expand_snippet(args.body) -- For `snippy` users.
        --end,
    --},
    --sources = cmp.config.sources({
        --{name = 'nvim_lsp'},
        --{ name = 'ultisnips' }, -- For ultisnips users.
    --}),
    --mappings = {
        --["<Tab>"] = cmp.select_next_item(),
        --["<S-Tab>"] = cmp.select_prev_item(),
        --["<c-y>"] = cmp.mapping.confirm {
            --behavior = cmp.ConfirmBehavior.Insert,
            --select = true,
         --},
    --},
--})

--local opts = { noremap=true, silent=true }
--vim.api.nvim_set_keymap('n', '<space>e', '<cmd>lua vim.diagnostic.open_float()<CR>', opts)
--vim.api.nvim_set_keymap('n', '<space>q', '<cmd>lua vim.diagnostic.setloclist()<CR>', opts)

--cmp.setup.cmdline('/', {
    --sources = {
        --{name = 'buffer'},
        --{name = 'path'}
    --}
--})


local on_attach = function(client, bufnr)
    local opts = { noremap=true, silent=true }

  -- See `:help vim.lsp.*` for documentation on any of the below functions
  vim.api.nvim_buf_set_keymap(bufnr,'n', '<C-k>', '<cmd>lua vim.diagnostic.goto_prev()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr,'n', '<C-j>', '<cmd>lua vim.diagnostic.goto_next()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>f', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)

end

--local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())

-- map buffer local keybindings when the language server attaches
local servers = { 'clangd', 'pyright', 'rust_analyzer'}
for _, lsp in pairs(servers) do
  require('lspconfig')[lsp].setup {
    capabilities=capabilities,
    on_attach = on_attach,
  }
end
