{ lib, ... }:

with lib;

{
  programs.fzf = {
    enable = true;
    enableBashIntegration = true;
    changeDirWidgetOptions = singleton "--preview 'tree -C {} | head -100'";
    fileWidgetOptions =
      singleton "--preview 'bat --color=always --line-range :100 {}'";
  };
}
