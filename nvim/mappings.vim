" Insert empty lines above and below
nnoremap [o O<ESC>j
nnoremap ]o o<ESC>k

" Make Y behave like the other capital letters:
nnoremap Y y$

" Center the results of search
nnoremap n nzzz
nnoremap N Nzzz
nnoremap J mzJ`z

" Insert mode bindings
inoremap <silent><nowait>jj <ESC>

" Yank to clipboard
nnoremap <leader>y "+y
vnoremap <leader>y "+y
nnoremap <leader>p "+p
vnoremap <leader>p "+p

map <C-c> <esc>

" Jumplist next and prev
map <C-h> <C-o>
map <C-l> <C-i>

" Edit Files
nnoremap <nowait><leader>fcc :source ~/.config/nvim/init.vim<cr>
nnoremap <nowait><leader>fs :w<CR>
nnoremap <nowait><leader>fS :wa<CR>

" Fuzzy finder
nnoremap <nowait><silent><leader>. :Files<cr>
" Select from opened buffers
nnoremap <nowait><silent><leader>b :Buffers<cr>
" RipGrep
nnoremap <nowait><silent><leader>r :Rg<cr>

" Windows
nnoremap <leader>h :wincmd h<cr>
nnoremap <leader>j :wincmd j<cr>
nnoremap <leader>k :wincmd k<cr>
nnoremap <leader>l :wincmd l<cr>
nnoremap <leader>q :q<cr>

" NerdTree
nnoremap <leader>nn :NERDTree<cr>
nnoremap <leader>nf :NERDTreeFocus<cr>
nnoremap <leader>nc :NERDTreeClose<cr>

" Maximizer
nnoremap <leader>m :MaximizerToggle<CR>

" Python - Run current buffer
autocmd FileType python map <buffer> <F5> :w<CR>:exec '!python3' shellescape(@%, 1)<CR>
autocmd FileType python imap <buffer> <F9> <esc>:w<CR>:exec '!python3' shellescape(@%, 1)<CR>

" Git fugitive
nnoremap <leader>gs :G<cr>
nnoremap <leader>gp :Git push<cr>
