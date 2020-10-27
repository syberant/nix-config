{ pkgs, config, ... }:

let polybar = { modules-left = "i3"; };
in {
  imports = [ ./common.nix ];

  # Enable i3 as desktop/window manager
  services.xserver.windowManager.i3 = {
    enable = true;
    configFile = pkgs.writeText "i3-config-file"
      (builtins.readFile ../dotfiles/i3/config
        + "exec_always --no-startup-id ${pkgs.polybar}/bin/polybar -c ${
          import ../generators/polybar.nix {
            config = config.systemInfo;
            inherit polybar;
          }
        } example &" + "exec ${pkgs.sxhkd}/bin/sxhkd -c ${
          import ../generators/sxhkdrc.nix { inherit pkgs; }
        } &"
        + "exec ${pkgs.dunst}/bin/dunst -config ${../dotfiles/dunst/config} &");
    package = pkgs.i3-gaps;
    extraPackages = with pkgs; [ dmenu feh rxvt_unicode ];
  };
}
