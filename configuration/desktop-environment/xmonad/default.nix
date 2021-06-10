{ pkgs, config, ... }:

{
  imports = [ ./autostart.nix ../common.nix ];

  services.xserver.windowManager.xmonad-sybrand = {
    enable = true;
  };

  environment.systemPackages = with pkgs; [
    (pkgs.callPackage ../scripts/fzfmenu.nix { })
  ];
}
