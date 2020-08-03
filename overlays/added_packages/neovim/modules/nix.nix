{ pkgs, ... }:

{
  plugins = with pkgs.vimPlugins; [ vim-nix neoformat ];

  # TODO: integrate dependency on nixfmt into this module
  code = ''
    augroup nix
      autocmd!
      autocmd BufWritePre *.nix undojoin | Neoformat nixfmt
    augroup END
  '';
}
