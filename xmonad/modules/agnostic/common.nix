{ pkgs, lib, config, ... }:

with lib;
let
  inherit (lib) mkEnableOption mkOption mkIf;
  cfg = config.services.xserver.sybrand-desktop-environment;
in {
  imports = [ ./polybar.nix ];

  options.services.xserver.sybrand-desktop-environment = {
    enable = mkEnableOption "Sybrand's desktop environment";

    xmonad = mkEnableOption "Sybrand's XMonad build" // { default = true; };

    autostart = mkOption {
      default = "";
      type = with types; lines;
      description = ''
        Programs that should be automatically started by the DE/WM.
      '';
    };

    impureConfig = mkEnableOption "non self-contained settings";
  };

  config = mkIf cfg.enable (mkMerge [
    {
      services.xserver.windowManager.xmonad-sybrand.enable =
        mkIf cfg.xmonad true;

      environment.variables.XMONAD_SYBRAND_STATUSBAR =
        "${pkgs.polybar}/bin/polybar -c ${cfg.polybar.dotfile} example";
      services.xserver.sybrand-desktop-environment.autostart = ''
        ${pkgs.sxhkd}/bin/sxhkd -c ${
          pkgs.callPackage ./dotfiles/sxhkdrc.nix { }
        } &
        ${pkgs.dunst}/bin/dunst -config ${./dotfiles/dunst-config} &
        ~/.fehbg || ${pkgs.feh} --bg-fill ${./background.jpg}
      '';

      environment.systemPackages = with pkgs; [ st ];

    }
    (mkIf cfg.impureConfig {
      # Hide mouse after a while
      services.unclutter = {
        enable = true;
        extraOptions = [ "noevents" "idle 2" ];
      };

      # Enable the X11 windowing system.
      services.xserver = {
        # Keyboard delay
        autoRepeatDelay = 250;
        xkbOptions = "compose:ralt";
      };

      # Enable compton
      services.compton = {
        enable = true;
        opacityRules = [
          "90:class_g = 'st-256color'"
          # "90:class_g = 'st-256color' && enabled"
          # "70:class_g = 'st-256color' && !enabled"
        ];
      };
    })
  ]);
}
