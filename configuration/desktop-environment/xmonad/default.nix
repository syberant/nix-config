{ pkgs, config, ... }:

{
  services.xserver.displayManager.xmonad = {
    enable = true;
    enableContribAndExtras = true;
  };
}
