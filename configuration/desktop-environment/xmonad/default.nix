{ pkgs, config, ... }:

{
  imports = [ ./autostart.nix ../common.nix ];

  services.xserver.windowManager.xmonad = {
    enable = true;
    enableContribAndExtras = true;
  };

  environment.systemPackages = with pkgs; [
    libnotify
    (pkgs.callPackage ../scripts/fzfmenu.nix { })
    dmenu feh rxvt_unicode 
  ];
}
