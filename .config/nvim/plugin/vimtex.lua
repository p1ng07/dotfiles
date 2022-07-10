vim.g.vimtex_syntax_conceal_disable = 1
vim.cmd([[
        let g:vimtex_compiler_latexmk = {
                    \ 'options' : [
                        \   '--shell-escape',
                        \   '-verbose',
                        \   '-file-line-error',
                        \   '-synctex=1',
                        \   '-interaction=nonstopmode',
                        \ ],
                        \}]])
