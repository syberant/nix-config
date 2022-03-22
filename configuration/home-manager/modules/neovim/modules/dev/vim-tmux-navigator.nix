{ pkgs, ... }:

{
  output.plugins = with pkgs.vimPlugins; [ vim-tmux-navigator ];
  output.path.path = with pkgs; [ tmux ];
}
