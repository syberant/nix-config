{ pkgs, ... }:

{
  plugins = with pkgs.vimPlugins; [ neoformat ];
  code = ''
    let g:neoformat_haskell_stylishhaskell = {
      \ 'exe' : '${pkgs.stylish-haskell}/bin/stylish-haskell',
      \ 'stdin' : 1,
    \ }

    augroup haskell
      autocmd!
      autocmd BufWritePre *.hs undojoin | Neoformat! haskell
    augroup END

  '';
}
