" Window keybindings
" Move focus
nnoremap <silent> <leader>wh <C-w>h
nnoremap <silent> <leader>wj <C-w>j
nnoremap <silent> <leader>wk <C-w>k
nnoremap <silent> <leader>wl <C-w>l
nnoremap <silent> <leader>w0 <C-w>w
" Resizing
nnoremap <silent> <leader>w= <C-w>=
" Split
nnoremap <silent> <leader>ws <C-w>s
nnoremap <silent> <leader>wv <C-w>v
nnoremap <silent> <leader>wn <C-w>n
" Close
nnoremap <silent> <leader>wc <C-w>c


" Formatting/finding
nnoremap <silent> <leader>ff :Neoformat<CR>
nnoremap <silent> <leader>fs :nohlsearch<CR>
nnoremap <silent> <leader>fo :Telescope find_files<CR>
nnoremap <silent> <leader>fb :Telescope buffers<CR>
nnoremap <silent> <leader>f/ :Telescope live_grep<CR>


" LaTeX
nnoremap <leader>ll :VimtexCompile<CR>
nnoremap <leader>lc :VimtexCountWords<CR>
nnoremap <leader>le :VimtexErrors<CR>
nnoremap <leader>lv :VimtexView<CR>

