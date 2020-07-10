
{ config, pkgs, ... }:

{
  services.minecraft-server = {
    enable = true;
    eula = true;
    openFirewall = true;
    declarative = true;
    serverProperties = {
      difficulty = 0;
      online-mode = false;
      pvp = false;
      snooper-enabled = false;
      motd = "Server van Sybrand";
    };

    # Use version 1.16.1
    package = let
      unstable = import (builtins.fetchTarball {
        url = "https://github.com/nixos/nixpkgs/archive/4f1bb1307bbbd5b030bcd7dfbeb5d56ee068b537.tar.gz";
        sha256 = "1dvgrk9n1p83q9lmfmbyff7h8n12x8jxw0wjgy4hwfjd5b4g9wrn";
      }) { config.allowUnfree = true; };
    in unstable.minecraft-server;
  };
}
