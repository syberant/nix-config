{ self, pkgs, lib, config, ... }:

with lib;

let
  inherit (lib) mkOption mkIf;
  cfg = config.services.xserver.windowManager.xmonad-sybrand;
in {
  # TODO: add these dependencies again
  # environment.systemPackages = [(pkgs.callPackage ../scripts/fzfmenu.nix { })];

  options = {
    services.xserver.windowManager.xmonad-sybrand = {
      enable = mkEnableOption "xmonad-sybrand";

      package = mkOption {
        # TODO: remove dependency on overlay
        default = pkgs.xmonad-sybrand;
        type = with types; package;
        description = ''
          The final package that is used, overrides all other configurations if set.
        '';
      };
    };
  };
  config = mkIf cfg.enable {
    warnings = if config.services.xserver.windowManager.xmonad.enable then [''
      You have enabled both the XMonad Window Manager and Sybrand's custom build of it.
      This could cause some problems due to naming collisions.
    ''] else
      [ ];

    services.xserver.sybrand-desktop-environment.polybar.config."bar/example".modules-left = [ "ewmh" ];

    services.xserver.windowManager = {
      session = [{
        name = "xmonad";
        start = ''
          systemd-cat -t xmonad ${cfg.package}/bin/xmonad &
          waitPID=$!
          bash ${pkgs.writeScript "autostart_de.sh" config.services.xserver.sybrand-desktop-environment.autostart}
        '';
      }];
    };

    environment.systemPackages = with pkgs; [
      cfg.package

      libnotify
      dmenu
      feh
      rxvt_unicode
    ];
  };
}
