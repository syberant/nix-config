{ ... }:

{
  programs.z-lua = {
    enable = true;

    # enableAliases = true;
    enableBashIntegration = true;
    options = [ "enhanced" "once" "fzf" ];
  };
}
