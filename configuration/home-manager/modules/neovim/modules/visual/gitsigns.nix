{ pkgs, ... }:

{
  plugin.setup.gitsigns = {
  };

  output.plugins = with pkgs.vimPlugins; [ gitsigns-nvim ];
  output.path.path = with pkgs; [ git ];
}
