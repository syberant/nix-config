{ pkgs, config, ... }:

{
  imports = [ ./autostart.nix ];

  services.xserver.windowManager.xmonad = {
    enable = true;
    enableContribAndExtras = true;
  };

  environment.systemPackages = with pkgs; [ libnotify ];
}
