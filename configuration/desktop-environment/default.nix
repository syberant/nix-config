{ pkgs, config, ... }:

{
  services.displayManager.defaultSession = "none+xmonad";
  services.xserver = {
    enable = true;
    sybrand-desktop-environment = {
      enable = true;
      impureConfig = true;
      polybar.enablePomo = true;
    };
  };

  environment.systemPackages = with pkgs;
    [ (pkgs.callPackage ./scripts/fzfmenu.nix { }) ];
}
