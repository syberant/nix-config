{ pkgs, ... }:

{
  output.plugins = with pkgs.vimPlugins; [ vim-nix ];
}
