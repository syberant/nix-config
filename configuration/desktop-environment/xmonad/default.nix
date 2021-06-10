{ pkgs, config, ... }:

{
  services.xserver = {
    enable = true;
    sybrand-desktop-environment = {
      enable = true;
      impureConfig = true;
    };
    displayManager.defaultSession = "none+xmonad";
  };

  environment.systemPackages = with pkgs;
    [ (pkgs.callPackage ../scripts/fzfmenu.nix { }) ];
}
