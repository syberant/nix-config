{ pkgs, config, ... }:

let
  confdir = ../..;
  polybar = { modules-left = "ewmh"; };
  autostart = pkgs.writeScriptBin "autostart_xmonad" ''
    # TODO: use polybar dwm module or add EWMH patch to dwm
    ${pkgs.polybar}/bin/polybar -c ${
      pkgs.callPackage (confdir + "/generators/polybar.nix") {
        config = config.systemInfo;
        inherit polybar;
      }
    } example &
    ${pkgs.sxhkd}/bin/sxhkd -c ${
      import (confdir + "/generators/sxhkdrc.nix") { inherit pkgs; }
    } &
    ${pkgs.dunst}/bin/dunst -config ${confdir + "/dotfiles/dunst/config"} &
    ~/.fehbg || feh --bg-fill ${./background.jpg}
  '';
in { environment.systemPackages = with pkgs; [ autostart feh ]; }
