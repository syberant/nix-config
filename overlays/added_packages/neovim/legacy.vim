" -------
" Plugins
" -------
" Easy editing
" Plug 'jeetsukumaran/vim-buffergator'
" Plug 'scrooloose/nerdtree'
" Plug 'scrooloose/nerdcommenter'
" Plug 'tpope/vim-surround'
" Plug 'tpope/vim-unimpaired'
" Plug 'townk/vim-autoclose'
" Plug 'bronson/vim-trailing-whitespace'
" Plug 'easymotion/vim-easymotion'
" Plug 'airblade/vim-gitgutter'
" Plug 'majutsushi/tagbar', { 'on': 'TagbarToggle' }
" Plug 'sirver/ultisnips'

" Aesthetics
" Plug 'itchyny/lightline.vim'
" Plug 'junegunn/goyo.vim', { 'on': 'Goyo' }
" Plug 'junegunn/limelight.vim', { 'on': 'Limelight' }

" Autocompletion
"Plug '~/.vim/bundle/YouCompleteMe', { 'on': 'YCM' }

" Language support
" Plug 'vim-syntastic/syntastic', { 'on': 'Syntastic' }
" C
" if has('nvim')
    " Plug 'arakashic/chromatica.nvim', { 'for': ['c', 'cpp', 'objc', 'objcpp'] }
" endif
" Objective-C / Cocoa
" Plug 'msanders/cocoa.vim', { 'for': 'objc' }
" Rust
" Plug 'rust-lang/rust.vim', { 'for': 'rust' }
" Plug 'racer-rust/vim-racer', { 'for': 'rust' }
" Plug 'sebastianmarkow/deoplete-rust', { 'for': 'rust' }
" Plug 'cespare/vim-toml', { 'for': 'toml' }
" (La)TeX
" Plug 'lervag/vimtex', { 'for': ['tex', 'plaintex'] }
" Markdown
" Plug 'vim-pandoc/vim-pandoc-syntax', { 'for': 'markdown' }
" Plug 'LaTeX-Box-Team/LaTeX-Box'
" Haskell
" Plug 'neovimhaskell/haskell-vim', { 'for': 'haskell' }
" JavaScript
" Plug 'pangloss/vim-javascript', { 'for': 'javascript' }
" Plug 'kchmck/vim-coffee-script', { 'for': 'coffee' }
" Go
" Plug 'fatih/vim-go', { 'for': 'go' }

" Colour theme
" Plug 'ayu-theme/ayu-vim'
" Plug 'morhetz/gruvbox'
" Plug 'junegunn/seoul256.vim'
" if has('nvim')
    " Plug 'vim-scripts/AfterColors.vim'
" endif
" Plug 'lilydjwg/colorizer'

let base16colorspace=256    " Access colors present in 256 colorspace
let t_Co = 256              " Use 256 colors in terminal

" -------
" Keymaps
" -------
nmap <F8> :TagbarToggle<CR>
nmap <C-f> :NERDTreeToggle<CR>
" Toggle comments with ';'
nmap ; <Plug>NERDCommenterToggle

" Map Ctrl h/k/j/l to Ctrl+w + h/k/j/l
nmap <C-h> <C-w>h
nmap <C-k> <C-w>k
nmap <C-j> <C-w>j
nmap <C-l> <C-w>l

" Get terminal functionality
function! g:TerminalShortcut()
    let targetbuffer = matchstr(bufname(''), "term\.\*")
    if empty(targetbuffer)
        let targetbuffer = 'term'

        " open terminal if there isn't one open already
        if empty(bufname('term'))
            :terminal
        endif
    else
        let targetbuffer = '#'
    endif

    return targetbuffer
endfunction
nmap ` :exec "buffer" g:TerminalShortcut() <CR>

" Map Ctrl z to toggling focus mode
map <C-z> :Goyo<CR>

" Map Ctrl d to switching buffers
map <C-h> :BuffergatorToggle<CR>

" Stop map conflict with <leader> tc
nnoremap <F1> <Plug>Colorizer

" ----------------
" Limelight config
" ----------------

" Number of preceding/following paragraphs to include (default: 0)
let g:limelight_paragraph_span = 1

" Activate Limelight when in focus mode
autocmd! User GoyoEnter Limelight
autocmd! User GoyoLeave Limelight!

" --------------------
" NERDCommenter config
" --------------------
let g:NERDSpaceDelims = 1
let g:NERDCompactSexyComs = 1
let g:NERDDefaultAlign = 'left'
let g:NERDCommentEmptyLines = 1
let g:NERDTrimTrailingWhitespace = 1
let g:NERDCustomDelimiters = {
    \ 'rust': {'left': '//'},
\ }

" -------------
" Tagbar config
" -------------
let g:tagbar_type_rust = {
    \ 'ctagstype' : 'rust',
    \ 'kinds' : [
        \'T:types,type definitions',
        \'f:functions,function definitions',
        \'g:enum,enumeration names',
        \'s:structure names',
        \'m:modules,module names',
        \'c:consts,static constants',
        \'t:traits',
        \'i:impls,trait implementations',
    \]
\}
let g:tagbar_type_objc = {
    \ 'ctagstype' : 'ObjectiveC',
    \ 'kinds'     : [
        \ 'i:interface',
        \ 'I:implementation',
        \ 'p:Protocol',
        \ 'm:Object_method',
        \ 'c:Class_method',
        \ 'v:Global_variable',
        \ 'F:Object field',
        \ 'f:function',
        \ 'p:property',
        \ 't:type_alias',
        \ 's:type_structure',
        \ 'e:enumeration',
        \ 'M:preprocessor_macro',
    \ ],
    \ 'sro'        : ' ',
    \ 'kind2scope' : {
        \ 'i' : 'interface',
        \ 'I' : 'implementation',
        \ 'p' : 'Protocol',
        \ 's' : 'type_structure',
        \ 'e' : 'enumeration'
    \ },
    \ 'scope2kind' : {
        \ 'interface'      : 'i',
        \ 'implementation' : 'I',
        \ 'Protocol'       : 'p',
        \ 'type_structure' : 's',
        \ 'enumeration'    : 'e'
    \ }
\ }
let g:tagbar_type_markdown = {
    \ 'ctagstype' : 'markdown',
    \ 'kinds' : [
        \ 'h:Heading_L1',
        \ 'i:Heading_L2',
        \ 'k:Heading_L3'
    \ ]
\ }

" --------------
" snippet config
" --------------
let g:UltiSnipsExpandTrigger='<tab>'
let g:UltiSnipsJumpForwardTrigger='<tab>'
let g:UltiSnipsJumpBackwardTrigger='<s-tab>'
let g:UltiSnipsSnippetDirectories=[$HOME."/.config/nvim/UltiSnips"]

" ------------
" Racer config
" ------------
set hidden
let g:racer_cmd = "~/.cargo/bin/racer"
let g:racer_experimental_completer = 1
" au FileType rust nmap gd <Plug>(rust-def)
" au FileType rust nmap gs <Plug>(rust-def-split)
" au FileType rust nmap gx <Plug>(rust-def-vertical)
" au FileType rust nmap <leader>gd <Plug>(rust-doc)
au FileType rust nmap gd :YcmCompleter GoTo<CR>

" -----------------
" Chromatica config
" -----------------
let g:chromatica#libclang_path='/usr/local/opt/llvm/lib'
" let g:chromatica#enable_at_startup=1
if has('nvim')
  au FileType c ChromaticaStart
  au FileType cpp ChromaticaStart
  au FileType objc ChromaticaStart
  au FileType objcpp ChromaticaStart
endif

" -----------
" Rust config
" -----------
let g:rustfmt_autosave = 1
let g:syntastic_rust_checkers = ['cargo']
let g:ycm_rust_src_path = '~/.rustup/toolchains/nightly-x86_64-apple-darwin/lib/rustlib/src/rust/src'

" ----------------
" Syntastic config
" ----------------
set statusline+=%#warningmsg#
" set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_enable_signs = 1

let g:syntastic_cpp_gcc_args = "-std=c++11 -Wall -Wextra"

" --------------------
" Deoplete Rust config
" --------------------
" let g:deoplete#sources#rust#racer_binary='/Users/splinter/.cargo/bin/racer'
" let g:deoplete#sources#rust#rust_source_path='/Users/splinter/.rustup/toolchains/nightly-x86_64-apple-darwin/lib/rustlib/src/rust/src'

" -------------
" vimtex config
" -------------
set conceallevel=1
let g:tex_conceal='abdmg'

" --------------------
" YouCompleteMe config
" --------------------
let g:ycm_auto_trigger=1
let g:ycm_key_list_stop_completion = ['<C-y>']

" ---------------
" Terminal config
" ---------------
if has('neovim')
  autocmd TermOpen * setlocal scrollback=2500
endif

" Copy/paste from/to system clipboard
noremap <C-c> "+y
noremap <C-p> "+P

" Set italics escape sequences.
set t_ZH=[3m
set t_ZR=[23m

" Tab settings
set tabstop=4
set softtabstop=4 expandtab
set shiftwidth=4

" Scroll settings
" set so=3

" Mouse settings
set mouse=nv " Normal and Visual

if has('mac')
    let g:python3_host_prog = "/Library/Frameworks/Python.framework/Versions/3.6/bin/python3"
    let g:python_host_prog = "/usr/local/bin/python2.7"
endif

" Reload khd config on write.
" au BufWritePost .khdrc !khd -e reload

" MAPPINGS by Sybrand Aarnoutse

" Use alt-up and alt-down like in VS Code
"nnoremap <ALT-<Up>>   :m+<CR>==
"nnoremap <ALT-<Down>> :m-2<CR>==
