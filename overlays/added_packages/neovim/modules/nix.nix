{ pkgs, ... }:

{
  plugins = with pkgs.vimPlugins; [ neoformat ];

  code = ''
    let g:neoformat_nix_nixfmt = {
      \ 'exe' : '${pkgs.nixfmt}/bin/nixfmt',
      \ 'stdin' : 1,
    \ }

    augroup nix
      autocmd!
      autocmd BufWritePre *.nix undojoin | Neoformat! nix
    augroup END
  '';
}
