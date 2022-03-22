{ pkgs, ... }:

# This file configures miscellaneous language-specific stuff.
# LSP and null-ls config is in their respective files

{
  output.plugins = with pkgs.vimPlugins; [ vim-nix ];
}
