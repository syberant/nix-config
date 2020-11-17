" TODO: use lazy loading instead so this ugly hack isn't needed
autocmd VimEnter * call which_key#register('<Space>', "g:which_key_map")
let g:which_key_map = {}

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

" Which-key
let g:which_key_map['w'] = {
    \ 'name' : '+windows' ,
    \ 'o' : ['<C-W>w'     , 'other-window']          ,
    \ 'c' : ['<C-W>c'     , 'delete-window']         ,
    \ 'h' : ['<C-W>h'     , 'window-left']           ,
    \ 'j' : ['<C-W>j'     , 'window-below']          ,
    \ 'l' : ['<C-W>l'     , 'window-right']          ,
    \ 'k' : ['<C-W>k'     , 'window-up']             ,
    \ '=' : ['<C-W>='     , 'balance-window']        ,
    \ 's' : ['<C-W>s'     , 'split-window-below']    ,
    \ 'v' : ['<C-W>v'     , 'split-window-below']    ,
    \ 'H' : ['<C-W>5<'    , 'expand-window-left']    ,
    \ 'J' : [':resize +5'  , 'expand-window-below']   ,
    \ 'L' : ['<C-W>5>'    , 'expand-window-right']   ,
    \ 'K' : [':resize -5'  , 'expand-window-up']      ,
    \ }

" Formatting/finding
nnoremap <silent> <leader>ff :Neoformat<CR>
nnoremap <silent> <leader>fs :nohlsearch<CR>
nnoremap <silent> <leader>fo :GFiles<CR>
nnoremap <silent> <leader>fb :Buffers<CR>
nnoremap <silent> <leader>f/ :Rg<CR>

" Which-key
let g:which_key_map['f'] = {
  \ 'name' : '+find/misc' ,
  \ 'f' : [':Neoformat', 'format-file'],
  \ 's' : [':nohlsearch', 'hide-search'],
  \ 'o' : [':GFiles', 'fzf-open-file'],
  \ 'b' : [':Buffers', 'fzf-buffers'],
  \ '/' : [':Rg', 'fzf-ripgrep'],
\ }
