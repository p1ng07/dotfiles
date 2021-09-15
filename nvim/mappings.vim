" Insert empty lines above and below
nnoremap [o O<ESC>j
nnoremap ]o o<ESC>k

" Insert mode bindings
"   End all braces with the ending brace
inoremap <silent><nowait>hh <ESC>


" Edit my beloved dotfiles
nmap <nowait><leader>fcv :e ~/.config/nvim/init.vim<cr>
nmap <nowait><leader>fcm :e ~/.config/nvim/mappings.vim<cr>
nmap <nowait><leader>fcc :e ~/.config/nvim/config.vim<cr>
"   Source main File
nnoremap <nowait><silent><leader>fcr :source ~/.config/nvim/init.vim<cr>


" Buffers
"   Previous buffer
nnoremap <nowait><leader>bp :bp<cr>		       
"   Previous buffer
nnoremap <nowait><leader>bn :bn<cr>	       
"   Buffer delete
nnoremap <nowait><leader>bd :bd<cr>		       
"   Buffer delete and file
nnoremap <nowait><leader>bD :!rm %<cr>:bd!<cr>     
"   Buffer go to
nnoremap <nowait><leader>bb :buffers<cr>:b
"   Buffer delete
nnoremap <nowait><leader>br :buffers<cr>:bdelete 
"   Buffer new
nnoremap <nowait><leader>bN :new<cr>


"   Fuzzy finder
nnoremap <nowait><silent><leader><leader> :FZF<cr>

" Windows
map <leader>ww :wincmd w<cr>	    
map <leader>wh :wincmd h<cr>
map <leader>wj :wincmd j<cr>
map <leader>wk :wincmd k<cr>
map <leader>wl :wincmd l<cr>

nnoremap <leader>wv :vsplit<cr>

" Clear search highlight
nnoremap <silent><nowait><leader>/ :nohl<cr>

" NerdTree
nnoremap <leader>nn :NERDTree<cr>
nnoremap <leader>nf :NERDTreeFocus<cr>
nnoremap <leader>nt :NERDTreeToggle<cr>
nnoremap <leader>nf :NERDTreeFind<cr>

" Tagbar
map <F8> :TagbarToggle<cr>

