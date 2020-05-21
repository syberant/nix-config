" required
set nocompatible
filetype off
filetype plugin indent on

" lightline config
set noshowmode
let g:lightline = {
    \ 'colorscheme': 'gruvbox',
    \ 'active': {
        \ 'left': [ [ 'mode', 'paste' ], [ 'readonly', 'filename', 'modified' ] ],
        \ 'right': [ ['lineinfo'], ['percent'], ['fileformat', 'fileencoding', 'filetype'] ],
    \ },
\ }

" colors
if has('termguicolors')
    set termguicolors
endif

" syntax
syntax on
set foldmethod=syntax
filetype plugin indent on
filetype plugin on
colo gruvbox
let g:gruvbox_contrast_dark='medium'
set background=dark
highlight Comment gui=italic
let g:lielight_conceal_ctermfg = 'gray'

" line number settings
set cursorline
set number
set relativenumber
set numberwidth=3

" wrapping settings
set wrap lbr
noremap <buffer> <silent> k gk
noremap <buffer> <silent> j gj
noremap <buffer> <silent> 0 g0
noremap <buffer> <silent> $ g$

" Better escaping? Don't exactly know why this is here.
tnoremap <Esc> <c-\><c-n>
inoremap <Esc> <Esc><Esc>
