{ pkgs, ... }:

{
  plugins = with pkgs.vimPlugins; [ vim-stylish-haskell ];
  code = ''
    let g:stylish_haskell_command = "${pkgs.stylish-haskell}/bin/stylish-haskell"
  '';
}
