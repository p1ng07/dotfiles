local lsp = require('lspconfig')
local cmp = require('cmp')

cmp.setup({
    snippet = {
        -- REQUIRED - you must specify a snippet engine
        expand = function(args)
            --vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
            -- require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
            vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
            -- require'snippy'.expand_snippet(args.body) -- For `snippy` users.
        end,
    },
    sources = cmp.config.sources({
        {name = 'nvim_lsp'},
        { name = 'ultisnips' }, -- For ultisnips users.
        { name = 'buffer' },
    }),

    mappings = {
        ['<C-d>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), { 'i', 'c' }),
        ['<C-u>'] = cmp.mapping(cmp.mapping.scroll_docs(4), { 'i', 'c' }),
        ['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
        ['<C-y>'] = cmp.config.disable, -- If you want to remove the default `<C-y>` mapping, You can specify `cmp.config.disable` value.
        ['<C-e>'] = cmp.mapping({
            i = cmp.mapping.abort(),
            c = cmp.mapping.close(),
        }),
        ['<tab>'] = cmp.mapping.confirm({ select = true }),
    },
}
)

cmp.setup.cmdline('/', {
    sources = {
        {name = 'buffer'},
        {name = 'path'}
    }
})

local function set_bo(...) vim.api.nvim_buf_set_option(bufnr, ...) end
local function set_key(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end

local on_attach = function(client, bufnr)
    local opts = { noremap=true, silent=true }

    set_key('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)

end

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)

---- Setup lsp server
lsp.texlab.setup{capabilities=capabilities, on_attach=on_attach}

--local sumneko_root_path = '/usr/bin/'
--local sumneko_binary = sumneko_root_path.."lua-language-server"
--local runtime_path = vim.split(package.path, ';')
--table.insert(runtime_path, "lua/?.lua")
--table.insert(runtime_path, "lua/?/init.lua")
--lsp.sumneko_lua.setup{
--cmd = {sumneko_binary, "-E", sumneko_root_path .. "/main.lua"};
--on_attach=on_attach,
--capabilities=capabilities,
--settings = {
--Lua = {
--runtime = {
---- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
--version = 'LuaJIT',
---- Setup your lua path
--path = runtime_path,
--},
--diagnostics = {
---- Get the language server to recognize the `vim` global
--globals = {'vim'},
--},
--workspace = {
---- Make the server aware of Neovim runtime files
--library = vim.api.nvim_get_runtime_file("", true),
--},
---- Do not send telemetry data containing a randomized but unique identifier
--telemetry = {
--enable = false,
--},
--},
--}
--}
--lsp.pyright.setup(coq.lsp_ensure_capabilities())

