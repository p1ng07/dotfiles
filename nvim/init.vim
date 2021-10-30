call plug#begin('~/.vim/plugged')
" LSP
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/nvim-cmp'
" ide/coc.nvim' ,{'branch': 'release','do': 'yarn install --frozen-lockfile'}

" Git integration
Plug 'tpope/vim-fugitive'

" Fuzzy finder
Plug 'junegunn/fzf', { 'do': {-> fzf#install() } }
Plug 'junegunn/fzf.vim'

" Code Display
Plug 'morhetz/gruvbox'
Plug 'yggdroot/indentline'
Plug 'ntpeters/vim-better-whitespace'

" Note taking
Plug 'lervag/vimtex'

" Project Explorer
Plug 'scrooloose/nerdtree'

" Airline
Plug 'vim-airline/vim-airline'

" Code editing
Plug 'preservim/nerdcommenter'

" Maximize windows
Plug 'szw/vim-maximizer'

call plug#end()

set concealcursor

lua require('config')
source ~/.config/nvim/mappings.vim
colo gruvbox

set completeopt=menu,menuone,noselect

lua <<EOF

local lsp = require('lspconfig')
local cmp = require('cmp')

cmp.setup({
    sources = cmp.config.sources({{name = 'nvim_lsp'}}),

    -- HELP -- as mappinsg são terríveis e não funcionam direitas
    mappings = {
      ['<C-n>'] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
      ['<C-p>'] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
      ['<C-d>'] = cmp.mapping.scroll_docs(-4),
      ['<C-f>'] = cmp.mapping.scroll_docs(4),
      ['<C-Space>'] = cmp.mapping.complete(),
      ['<C-e>'] = cmp.mapping.close(),
      ['<CR>'] = cmp.mapping.confirm({
        behavior = cmp.ConfirmBehavior.Replace,
        select = true,
      })
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

-- Setup lsp server
lsp.texlab.setup{
    on_attach=on_attach,
    capabilities=capabilities
}
local sumneko_root_path = '/usr/bin/'
local sumneko_binary = sumneko_root_path.."lua-language-server"
local runtime_path = vim.split(package.path, ';')
table.insert(runtime_path, "lua/?.lua")
table.insert(runtime_path, "lua/?/init.lua")
lsp.sumneko_lua.setup{
    cmd = {sumneko_binary, "-E", sumneko_root_path .. "/main.lua"};
    on_attach=on_attach,
    capabilities=capabilities,
    settings = {
        Lua = {
            runtime = {
                -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
                version = 'LuaJIT',
                -- Setup your lua path
                path = runtime_path,
                },
            diagnostics = {
                -- Get the language server to recognize the `vim` global
                globals = {'vim'},
                },
            workspace = {
                -- Make the server aware of Neovim runtime files
                library = vim.api.nvim_get_runtime_file("", true),
                },
            -- Do not send telemetry data containing a randomized but unique identifier
            telemetry = {
            enable = false,
            },
        },
    }
}
lsp.pyright.setup{
on_attach=on_attach,
capabilities=capabilities
}

EOF
